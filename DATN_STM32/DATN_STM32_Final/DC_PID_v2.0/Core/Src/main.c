/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "string.h"
#include "stdio.h" 
#include "stdlib.h"
#include "stdbool.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
#define pi 3.1415
#define p2r pi/400
#define sampletime 0.01
#define alpha 0.95
#define RX_BUFFER_SIZE 100
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
TIM_HandleTypeDef htim1;
TIM_HandleTypeDef htim2;
TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim4;

UART_HandleTypeDef huart2;
UART_HandleTypeDef huart3;

/* USER CODE BEGIN PV */
int32_t PosCnt_R, PosCnt_L, Cnttmp_R, Cnttmp_L;
volatile int16_t CountValue_R=0,CountValue_L=0;
int16_t HILIM =100 ,LOLIM =-100;
volatile int16_t CntVel_R, CntVel_L;
uint8_t PreviousState_R, PreviousState_L;	
int16_t pwm_R, pwm_L ; 
bool run=true, dir_R, dir_L;
float CurPos=0,DesiredPos;
float CurVel_R ;
float CurVel_L ;
int16_t DesiredSpeed_R, DesiredSpeed_L ;

volatile int32_t TotalCntVel_R = 0;
volatile int32_t TotalCntVel_L = 0;
volatile uint16_t uart_send_counter = 0;
//char Rx_indx, Rx_Buffer[20],Rx_data[2];
char dataVelocity_R[100], dataVelocity_L[100];

float Kp_R=0.2,Kd_R=0,Ki_R=5, Kb_R=100;
float Kp_L=0.2,Kd_L=0,Ki_L=5, Kb_L=100;

uint8_t Rx_Buffer[RX_BUFFER_SIZE];
uint8_t Rx_data[1];
uint8_t Rx_indx = 0; 
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_TIM1_Init(void);
static void MX_TIM2_Init(void);
static void MX_TIM3_Init(void);
static void MX_TIM4_Init(void);
static void MX_USART3_UART_Init(void);
static void MX_USART2_UART_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
//#ifdef __GNUC__
//	#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
//#else 
//	#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
//	#define GETCHAR_PROTOTYPE int fgetc(FILE *f)
//#endif 
//	PUTCHAR_PROTOTYPE
//	{
//		HAL_UART_Transmit(&huart2, (uint8_t*)&ch,1,100);
//		return ch;
//	}
	
/*
***********************************************************************
******** Truyen van toc bang uart ***********************	
***********************************************************************
*/

void parse_rpm_command() {
    if (Rx_Buffer[0] == 'V' && Rx_Buffer[1] == ',') {
        char *token;
        char *rest;
        rest = (char *)Rx_Buffer + 2;
        static char *saveptr;

        token = strtok(rest, ",");
        if (token != NULL) {
            DesiredSpeed_R = atoi(token);
        }

        token = strtok(NULL, ",");
        if (token != NULL) {
            DesiredSpeed_L = atoi(token);
        }
    }
}
	
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
	{
    if (huart->Instance == USART3) {
        if (Rx_indx < RX_BUFFER_SIZE - 1) {
            Rx_Buffer[Rx_indx++] = Rx_data[0];
            if (Rx_indx == 9) {
                Rx_Buffer[Rx_indx] = '\0';

                parse_rpm_command();

                Rx_indx = 0;
            }
        } else {
            Rx_indx = 0;
        }
        HAL_UART_Receive_IT(&huart3, Rx_data, 1);
    }
	}
	
	
void tx_print(char *str)
{
		HAL_UART_Transmit(&huart2, (uint8_t*) str, strlen(str), 100);
}

	
/*
***********************************************************************
******** Xu ly tin hieu encoder cua banh xe phai***********************	
***********************************************************************
*/

	
/****************************
****doc encoder channel A****
****************************/
	
void EXTI9_5_IRQHandler(void)	
{
  /* USER CODE BEGIN EXTI9_5_IRQn 0 */
unsigned char State0;
	State0 = (State0<<1) | HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_4);
	State0 = (State0<<1) | HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_5);
	State0 = State0&0x03;
	switch (State0) {
		case 0:
			if(PreviousState_R==1) { CntVel_R++; TotalCntVel_R++;}
			else { CntVel_R--; TotalCntVel_R--;}
		break;
		case 1:
			if(PreviousState_R==3) { CntVel_R++; TotalCntVel_R++;}
			else {CntVel_R--; TotalCntVel_R--;}
		break;
		case 2:
			if(PreviousState_R==0) { CntVel_R++; TotalCntVel_R++;}
			else { CntVel_R--; TotalCntVel_R--;}
		break;
		case 3:
			if(PreviousState_R==2) { CntVel_R++; TotalCntVel_R++;}
			else { CntVel_R--; TotalCntVel_R--;}
		break;
		}
	PreviousState_R = State0;
//	if (CountValue_R>=1600) {
//		CountValue_R = 0;
//		PosCnt_R++;
//	}
//	else if	(CountValue_R<=-1600) {
//		CountValue_R = 0;
//		PosCnt_R--;
//	}
  /* USER CODE END EXTI9_5_IRQn 0 */
  HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_5);
  /* USER CODE BEGIN EXTI9_5_IRQn 1 */
}

/****************************
****doc encoder channel B****
****************************/

void EXTI4_IRQHandler(void)	
{
  /* USER CODE BEGIN EXTI4_IRQn 0 */
unsigned char State1;
	State1 = (State1<<1) | HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_4);
	State1 = (State1<<1) | HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_5);
	State1 = State1&0x03;
	switch (State1) {
		case 0:
			if(PreviousState_R==1) { CntVel_R++; TotalCntVel_R++;}
			else { CntVel_R--; TotalCntVel_R--;}
		break;
		case 1:
			if(PreviousState_R==3) { CntVel_R++; TotalCntVel_R++;}
			else { CntVel_R--; TotalCntVel_R--;}
		break;
		case 2:
			if(PreviousState_R==0) { CntVel_R++; TotalCntVel_R++;}
			else { CntVel_R--; TotalCntVel_R--;}
		break;
		case 3:
			if(PreviousState_R==2) { CntVel_R++; TotalCntVel_R++;}
			else { CntVel_R--; TotalCntVel_R--;}
		break;
		}
	PreviousState_R = State1;
	
//	if (CountValue_R>=1600) {
//		CountValue_R = 0;
//		PosCnt_R++;
//	}
//	else if	(CountValue_R<=-1600) {
//		CountValue_R = 0;
//		PosCnt_R--;
//	}
  /* USER CODE END EXTI4_IRQn 0 */
  HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_4);
  /* USER CODE BEGIN EXTI4_IRQn 1 */

  /* USER CODE END EXTI4_IRQn 1 */
}

/*
***********************************************************************
******** Xu ly tin hieu encoder cua banh xe trai***********************	
***********************************************************************
*/


/****************************
****doc encoder channel A****
****************************/

void EXTI1_IRQHandler(void)	
{
  /* USER CODE BEGIN EXTI1_IRQn 0 */
unsigned char State3;
	State3 = (State3<<1) | HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_0);
	State3 = (State3<<1) | HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_1);
	State3 = State3&0x03;
	switch (State3) {
		case 0:
			if(PreviousState_L==1) { CntVel_L++; TotalCntVel_L++;}
			else { CntVel_L--; TotalCntVel_L--;}
		break;
		case 1:
			if(PreviousState_L==3) { CntVel_L++; TotalCntVel_L++;}
			else { CntVel_L--; TotalCntVel_L--;}
		break;
		case 2:
			if(PreviousState_L==0) { CntVel_L++; TotalCntVel_L++;}
			else { CntVel_L--; TotalCntVel_L--;}
		break;
		case 3:
			if(PreviousState_L==2) { CntVel_L++; TotalCntVel_L++;}
			else { CntVel_L--; TotalCntVel_L--;}
		break;
		}
	PreviousState_L = State3;
		
//	if (CountValue_L>=1600) {
//		CountValue_L = 0;
//		PosCnt_L++;
//	}
//	else if	(CountValue_L<=-1600) {
//		CountValue_L = 0;
//		PosCnt_L--;
//	}
  /* USER CODE END EXTI1_IRQn 0 */
  HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_1);
  /* USER CODE BEGIN EXTI1_IRQn 0 */
}

/****************************
****doc encoder channel B****
****************************/

void EXTI0_IRQHandler(void)
{
  /* USER CODE BEGIN EXTI0_IRQn 0 */
unsigned char State4;
	State4 = (State4<<1) | HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_0);
	State4 = (State4<<1) | HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_1);
	State4 = State4&0x03;
	switch (State4) {
		case 0:
			if(PreviousState_L==1) { CntVel_L++; TotalCntVel_L++;}
			else { CntVel_L--; TotalCntVel_L--;}
		break;
		case 1:
			if(PreviousState_L==3) { CntVel_L++; TotalCntVel_L++;}
			else { CntVel_L--; TotalCntVel_L--;}
		break;
		case 2:
			if(PreviousState_L==0) { CntVel_L++; TotalCntVel_L++;}
			else { CntVel_L--; TotalCntVel_L--;}
		break;
		case 3:
			if(PreviousState_L==2) { CntVel_L++; TotalCntVel_L++;}
			else { CntVel_L--; TotalCntVel_L--;}
		break;
		}
	PreviousState_L = State4;
	
//	if (CountValue_L>=1600) {
//		CountValue_L = 0;
//		PosCnt_L++;
//	}
//	else if	(CountValue_L<=-1600) {
//		CountValue_L = 0;
//		PosCnt_L--;
//	}
  /* USER CODE END EXTI0_IRQn 0 */
  HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_0);
  /* USER CODE BEGIN EXTI0_IRQn 0 */

  /* USER CODE END EXTI0_IRQn 0 */
}


/*
***********************************************************************
****************** Bo dieu khien PID cho van toc **********************
***********************************************************************
*/

int PIDVel_R(float Desiredvalue, float Currentvalue){

	static float errp = 0, e_reset = 0 ; 
	static float uip = 0, ud_f_p = 0 ; 
	float err,up,ud,ui, ud_f ; 
	int uout , uout_anti_windup ; 
	
	err = Desiredvalue - Currentvalue ; 
	
	up = Kp_R*err ; 
	ud = Kd_R*(err-errp)/sampletime ; 
	ud_f = (1-alpha) * ud_f_p + alpha * ud;
	ui = uip + Ki_R*err*sampletime + Kb_R * sampletime * e_reset ; 
	
	errp = err ; 
	uip = ui ; 
	ud_f_p = ud_f;
	uout =(int)(up+ud_f+ui); 
	
	if(uout>HILIM) uout_anti_windup = 100 ; 
	else if (uout < LOLIM)(uout_anti_windup = -100);
	else uout_anti_windup = uout;
	e_reset = uout_anti_windup - uout;
	return uout_anti_windup ; 

}

int PIDVel_L(float Desiredvalue, float Currentvalue){

	static float errp = 0, e_reset = 0 ; 
	static float uip = 0, ud_f_p = 0 ; 
	float err,up,ud,ui, ud_f ; 
	int uout , uout_anti_windup ; 
	
	err = Desiredvalue - Currentvalue ; 
	
	up = Kp_L*err ; 
	ud = Kd_L*(err-errp)/sampletime ; 
	ud_f = (1-alpha) * ud_f_p + alpha * ud;
	ui = uip + Ki_L*err*sampletime + Kb_L * sampletime * e_reset ; 
	
	errp = err ; 
	uip = ui ; 
	ud_f_p = ud_f;
	uout =(int)(up+ud_f+ui); 
	
	if(uout>HILIM) uout_anti_windup = 100 ; 
	else if (uout < LOLIM)(uout_anti_windup = -100);
	else uout_anti_windup = uout;
	e_reset = uout_anti_windup - uout;
	return uout_anti_windup ; 

}


/*
***********************************************************************
************ Xu ly ngat TIM de tinh toan van toc **********************
***********************************************************************
*/


void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
	
	if(htim->Instance==TIM2)
	{
		uart_send_counter++;
		if (uart_send_counter >= 10) {
				uart_send_counter = 0;
				char buffer[50];
				sprintf(buffer, "L:%d, R:%d\n", TotalCntVel_L, TotalCntVel_R);
				HAL_UART_Transmit_IT(&huart2, (uint8_t*)buffer, strlen(buffer));
//				HAL_UART_Transmit(&huart2, (uint8_t*) buffer, strlen(buffer), 1000);
//				tx_print(buffer);
		}

		
		Cnttmp_R = CntVel_R;
		CntVel_R = 0;
		CurVel_R = 9.549279*Cnttmp_R*pi/8;
		
    pwm_R = PIDVel_R(DesiredSpeed_R, CurVel_R);
		
		if (pwm_R >0)
			dir_R = 1 ;
		else {
		pwm_R *=-1; 
		dir_R = 0 ; }
		
		if (dir_R==1){
				__HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_1, pwm_R);
				__HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_2, 0);
		}
		else {
				__HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_1, 0);
				__HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_2, pwm_R);			
		}	
		
		Cnttmp_L = CntVel_L;
		CntVel_L = 0;
		CurVel_L = 9.549279*Cnttmp_L*pi/8;

    pwm_L = PIDVel_L(DesiredSpeed_L, CurVel_L);
		
		if (pwm_L >0)
			dir_L = 1 ;
		else {
		pwm_L *=-1; 
		dir_L = 0 ; }
		
		if (dir_L==1){
				__HAL_TIM_SetCompare(&htim3, TIM_CHANNEL_1, pwm_L);
				__HAL_TIM_SetCompare(&htim3, TIM_CHANNEL_2, 0);
		}
		else {
				__HAL_TIM_SetCompare(&htim3, TIM_CHANNEL_1, 0);
				__HAL_TIM_SetCompare(&htim3, TIM_CHANNEL_2, pwm_L);			
		}			
	}
}

void send_UART_Data(UART_HandleTypeDef *huart, uint32_t time_ms, int64_t desired_vel, float actual_vel) {
    char buffer[100]; // B? d?m d? ch?a chu?i d? li?u
    int len;

    // Ð?nh d?ng chu?i: "Time: xxx ms, Encoder: xxx, RPM: xxx.xx\r\n"
    len = sprintf(buffer, "%lu,%lld,%.2f\r\n", 
                  time_ms, desired_vel, actual_vel);

    // G?i d? li?u qua UART
    HAL_UART_Transmit(huart, (uint8_t *)buffer, len, HAL_MAX_DELAY);
}
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_TIM1_Init();
  MX_TIM2_Init();
  MX_TIM3_Init();
  MX_TIM4_Init();
  MX_USART3_UART_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */
	HAL_UART_Receive_IT(&huart3, Rx_data, 1);
	HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
	HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);
	HAL_TIM_Base_Start_IT(&htim2);
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_1, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_0, GPIO_PIN_SET);
	
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_2);
//	HAL_TIM_Base_Start_IT(&htim4);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3, GPIO_PIN_SET);

//	__HAL_TIM_SetCompare(&htim3, TIM_CHANNEL_1, 0);
//	__HAL_TIM_SetCompare(&htim3, TIM_CHANNEL_2, 50);	
//	
//	__HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_1, 0);
//	__HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_2, 50);
			
//	HAL_UART_Receive_IT(&huart1,(uint8_t*)Rx_data,1);
//	HAL_UART_Receive_IT(&huart1, Rx_data, 1);
	
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
		static uint32_t time_ms = 0;
//		sprintf(dataVelocity_R,"%f\r\n",CurVel_R);
//		tx_print(dataVelocity_R);
//		sprintf(dataVelocity_L,"%f\r\n",CurVel_L);
//		tx_print(dataVelocity_L);
		HAL_Delay(100);
		send_UART_Data(&huart2, time_ms, DesiredSpeed_L, CurVel_L); // G?i d? li?u qua UART
    time_ms += 100; // Tang th?i gian
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI_DIV2;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL12;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV4;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief TIM1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM1_Init(void)
{

  /* USER CODE BEGIN TIM1_Init 0 */

  /* USER CODE END TIM1_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  /* USER CODE BEGIN TIM1_Init 1 */

  /* USER CODE END TIM1_Init 1 */
  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 11;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 100;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  if (HAL_TIMEx_ConfigBreakDeadTime(&htim1, &sBreakDeadTimeConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM1_Init 2 */

  /* USER CODE END TIM1_Init 2 */
  HAL_TIM_MspPostInit(&htim1);

}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  /* USER CODE BEGIN TIM2_Init 0 */

  /* USER CODE END TIM2_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM2_Init 1 */

  /* USER CODE END TIM2_Init 1 */
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 23999;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 9;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim2) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim2, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM2_Init 2 */

  /* USER CODE END TIM2_Init 2 */

}

/**
  * @brief TIM3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM3_Init(void)
{

  /* USER CODE BEGIN TIM3_Init 0 */

  /* USER CODE END TIM3_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM3_Init 1 */

  /* USER CODE END TIM3_Init 1 */
  htim3.Instance = TIM3;
  htim3.Init.Prescaler = 11;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = 100;
  htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim3, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM3_Init 2 */

  /* USER CODE END TIM3_Init 2 */
  HAL_TIM_MspPostInit(&htim3);

}

/**
  * @brief TIM4 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM4_Init(void)
{

  /* USER CODE BEGIN TIM4_Init 0 */

  /* USER CODE END TIM4_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM4_Init 1 */

  /* USER CODE END TIM4_Init 1 */
  htim4.Instance = TIM4;
  htim4.Init.Prescaler = 23999;
  htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim4.Init.Period = 9;
  htim4.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim4.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim4) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim4, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim4, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM4_Init 2 */

  /* USER CODE END TIM4_Init 2 */

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief USART3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART3_UART_Init(void)
{

  /* USER CODE BEGIN USART3_Init 0 */

  /* USER CODE END USART3_Init 0 */

  /* USER CODE BEGIN USART3_Init 1 */

  /* USER CODE END USART3_Init 1 */
  huart3.Instance = USART3;
  huart3.Init.BaudRate = 115200;
  huart3.Init.WordLength = UART_WORDLENGTH_8B;
  huart3.Init.StopBits = UART_STOPBITS_1;
  huart3.Init.Parity = UART_PARITY_NONE;
  huart3.Init.Mode = UART_MODE_RX;
  huart3.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart3.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart3) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART3_Init 2 */

  /* USER CODE END USART3_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, GPIO_PIN_0|GPIO_PIN_1, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3|GPIO_PIN_4, GPIO_PIN_RESET);

  /*Configure GPIO pins : PA0 PA1 */
  GPIO_InitStruct.Pin = GPIO_PIN_0|GPIO_PIN_1;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : PA4 PA5 */
  GPIO_InitStruct.Pin = GPIO_PIN_4|GPIO_PIN_5;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING_FALLING;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : PB0 PB1 */
  GPIO_InitStruct.Pin = GPIO_PIN_0|GPIO_PIN_1;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING_FALLING;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pins : PB3 PB4 */
  GPIO_InitStruct.Pin = GPIO_PIN_3|GPIO_PIN_4;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI0_IRQn);

  HAL_NVIC_SetPriority(EXTI1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI1_IRQn);

  HAL_NVIC_SetPriority(EXTI4_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI4_IRQn);

  HAL_NVIC_SetPriority(EXTI9_5_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI9_5_IRQn);

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
