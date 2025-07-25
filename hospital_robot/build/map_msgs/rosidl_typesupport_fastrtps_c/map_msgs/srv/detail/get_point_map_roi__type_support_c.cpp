// generated from rosidl_typesupport_fastrtps_c/resource/idl__type_support_c.cpp.em
// with input from map_msgs:srv/GetPointMapROI.idl
// generated code does not contain a copyright notice
#include "map_msgs/srv/detail/get_point_map_roi__rosidl_typesupport_fastrtps_c.h"


#include <cassert>
#include <limits>
#include <string>
#include "rosidl_typesupport_fastrtps_c/identifier.h"
#include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "map_msgs/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "map_msgs/srv/detail/get_point_map_roi__struct.h"
#include "map_msgs/srv/detail/get_point_map_roi__functions.h"
#include "fastcdr/Cdr.h"

#ifndef _WIN32
# pragma GCC diagnostic push
# pragma GCC diagnostic ignored "-Wunused-parameter"
# ifdef __clang__
#  pragma clang diagnostic ignored "-Wdeprecated-register"
#  pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
# endif
#endif
#ifndef _WIN32
# pragma GCC diagnostic pop
#endif

// includes and forward declarations of message dependencies and their conversion functions

#if defined(__cplusplus)
extern "C"
{
#endif


// forward declare type support functions


using _GetPointMapROI_Request__ros_msg_type = map_msgs__srv__GetPointMapROI_Request;

static bool _GetPointMapROI_Request__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _GetPointMapROI_Request__ros_msg_type * ros_message = static_cast<const _GetPointMapROI_Request__ros_msg_type *>(untyped_ros_message);
  // Field name: x
  {
    cdr << ros_message->x;
  }

  // Field name: y
  {
    cdr << ros_message->y;
  }

  // Field name: z
  {
    cdr << ros_message->z;
  }

  // Field name: r
  {
    cdr << ros_message->r;
  }

  // Field name: l_x
  {
    cdr << ros_message->l_x;
  }

  // Field name: l_y
  {
    cdr << ros_message->l_y;
  }

  // Field name: l_z
  {
    cdr << ros_message->l_z;
  }

  return true;
}

static bool _GetPointMapROI_Request__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _GetPointMapROI_Request__ros_msg_type * ros_message = static_cast<_GetPointMapROI_Request__ros_msg_type *>(untyped_ros_message);
  // Field name: x
  {
    cdr >> ros_message->x;
  }

  // Field name: y
  {
    cdr >> ros_message->y;
  }

  // Field name: z
  {
    cdr >> ros_message->z;
  }

  // Field name: r
  {
    cdr >> ros_message->r;
  }

  // Field name: l_x
  {
    cdr >> ros_message->l_x;
  }

  // Field name: l_y
  {
    cdr >> ros_message->l_y;
  }

  // Field name: l_z
  {
    cdr >> ros_message->l_z;
  }

  return true;
}  // NOLINT(readability/fn_size)

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_map_msgs
size_t get_serialized_size_map_msgs__srv__GetPointMapROI_Request(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _GetPointMapROI_Request__ros_msg_type * ros_message = static_cast<const _GetPointMapROI_Request__ros_msg_type *>(untyped_ros_message);
  (void)ros_message;
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // field.name x
  {
    size_t item_size = sizeof(ros_message->x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name y
  {
    size_t item_size = sizeof(ros_message->y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name z
  {
    size_t item_size = sizeof(ros_message->z);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name r
  {
    size_t item_size = sizeof(ros_message->r);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name l_x
  {
    size_t item_size = sizeof(ros_message->l_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name l_y
  {
    size_t item_size = sizeof(ros_message->l_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name l_z
  {
    size_t item_size = sizeof(ros_message->l_z);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

static uint32_t _GetPointMapROI_Request__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_map_msgs__srv__GetPointMapROI_Request(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_map_msgs
size_t max_serialized_size_map_msgs__srv__GetPointMapROI_Request(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  size_t last_member_size = 0;
  (void)last_member_size;
  (void)padding;
  (void)wchar_size;

  full_bounded = true;
  is_plain = true;

  // member: x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint64_t);
    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }
  // member: y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint64_t);
    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }
  // member: z
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint64_t);
    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }
  // member: r
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint64_t);
    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }
  // member: l_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint64_t);
    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }
  // member: l_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint64_t);
    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }
  // member: l_z
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint64_t);
    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }

  size_t ret_val = current_alignment - initial_alignment;
  if (is_plain) {
    // All members are plain, and type is not empty.
    // We still need to check that the in-memory alignment
    // is the same as the CDR mandated alignment.
    using DataType = map_msgs__srv__GetPointMapROI_Request;
    is_plain =
      (
      offsetof(DataType, l_z) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static size_t _GetPointMapROI_Request__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_map_msgs__srv__GetPointMapROI_Request(
    full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}


static message_type_support_callbacks_t __callbacks_GetPointMapROI_Request = {
  "map_msgs::srv",
  "GetPointMapROI_Request",
  _GetPointMapROI_Request__cdr_serialize,
  _GetPointMapROI_Request__cdr_deserialize,
  _GetPointMapROI_Request__get_serialized_size,
  _GetPointMapROI_Request__max_serialized_size
};

static rosidl_message_type_support_t _GetPointMapROI_Request__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_GetPointMapROI_Request,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, map_msgs, srv, GetPointMapROI_Request)() {
  return &_GetPointMapROI_Request__type_support;
}

#if defined(__cplusplus)
}
#endif

// already included above
// #include <cassert>
// already included above
// #include <limits>
// already included above
// #include <string>
// already included above
// #include "rosidl_typesupport_fastrtps_c/identifier.h"
// already included above
// #include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
// already included above
// #include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
// already included above
// #include "map_msgs/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
// already included above
// #include "map_msgs/srv/detail/get_point_map_roi__struct.h"
// already included above
// #include "map_msgs/srv/detail/get_point_map_roi__functions.h"
// already included above
// #include "fastcdr/Cdr.h"

#ifndef _WIN32
# pragma GCC diagnostic push
# pragma GCC diagnostic ignored "-Wunused-parameter"
# ifdef __clang__
#  pragma clang diagnostic ignored "-Wdeprecated-register"
#  pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
# endif
#endif
#ifndef _WIN32
# pragma GCC diagnostic pop
#endif

// includes and forward declarations of message dependencies and their conversion functions

#if defined(__cplusplus)
extern "C"
{
#endif

#include "sensor_msgs/msg/detail/point_cloud2__functions.h"  // sub_map

// forward declare type support functions
ROSIDL_TYPESUPPORT_FASTRTPS_C_IMPORT_map_msgs
size_t get_serialized_size_sensor_msgs__msg__PointCloud2(
  const void * untyped_ros_message,
  size_t current_alignment);

ROSIDL_TYPESUPPORT_FASTRTPS_C_IMPORT_map_msgs
size_t max_serialized_size_sensor_msgs__msg__PointCloud2(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment);

ROSIDL_TYPESUPPORT_FASTRTPS_C_IMPORT_map_msgs
const rosidl_message_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, sensor_msgs, msg, PointCloud2)();


using _GetPointMapROI_Response__ros_msg_type = map_msgs__srv__GetPointMapROI_Response;

static bool _GetPointMapROI_Response__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _GetPointMapROI_Response__ros_msg_type * ros_message = static_cast<const _GetPointMapROI_Response__ros_msg_type *>(untyped_ros_message);
  // Field name: sub_map
  {
    const message_type_support_callbacks_t * callbacks =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_fastrtps_c, sensor_msgs, msg, PointCloud2
      )()->data);
    if (!callbacks->cdr_serialize(
        &ros_message->sub_map, cdr))
    {
      return false;
    }
  }

  return true;
}

static bool _GetPointMapROI_Response__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _GetPointMapROI_Response__ros_msg_type * ros_message = static_cast<_GetPointMapROI_Response__ros_msg_type *>(untyped_ros_message);
  // Field name: sub_map
  {
    const message_type_support_callbacks_t * callbacks =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_fastrtps_c, sensor_msgs, msg, PointCloud2
      )()->data);
    if (!callbacks->cdr_deserialize(
        cdr, &ros_message->sub_map))
    {
      return false;
    }
  }

  return true;
}  // NOLINT(readability/fn_size)

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_map_msgs
size_t get_serialized_size_map_msgs__srv__GetPointMapROI_Response(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _GetPointMapROI_Response__ros_msg_type * ros_message = static_cast<const _GetPointMapROI_Response__ros_msg_type *>(untyped_ros_message);
  (void)ros_message;
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // field.name sub_map

  current_alignment += get_serialized_size_sensor_msgs__msg__PointCloud2(
    &(ros_message->sub_map), current_alignment);

  return current_alignment - initial_alignment;
}

static uint32_t _GetPointMapROI_Response__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_map_msgs__srv__GetPointMapROI_Response(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_map_msgs
size_t max_serialized_size_map_msgs__srv__GetPointMapROI_Response(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  size_t last_member_size = 0;
  (void)last_member_size;
  (void)padding;
  (void)wchar_size;

  full_bounded = true;
  is_plain = true;

  // member: sub_map
  {
    size_t array_size = 1;


    last_member_size = 0;
    for (size_t index = 0; index < array_size; ++index) {
      bool inner_full_bounded;
      bool inner_is_plain;
      size_t inner_size;
      inner_size =
        max_serialized_size_sensor_msgs__msg__PointCloud2(
        inner_full_bounded, inner_is_plain, current_alignment);
      last_member_size += inner_size;
      current_alignment += inner_size;
      full_bounded &= inner_full_bounded;
      is_plain &= inner_is_plain;
    }
  }

  size_t ret_val = current_alignment - initial_alignment;
  if (is_plain) {
    // All members are plain, and type is not empty.
    // We still need to check that the in-memory alignment
    // is the same as the CDR mandated alignment.
    using DataType = map_msgs__srv__GetPointMapROI_Response;
    is_plain =
      (
      offsetof(DataType, sub_map) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static size_t _GetPointMapROI_Response__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_map_msgs__srv__GetPointMapROI_Response(
    full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}


static message_type_support_callbacks_t __callbacks_GetPointMapROI_Response = {
  "map_msgs::srv",
  "GetPointMapROI_Response",
  _GetPointMapROI_Response__cdr_serialize,
  _GetPointMapROI_Response__cdr_deserialize,
  _GetPointMapROI_Response__get_serialized_size,
  _GetPointMapROI_Response__max_serialized_size
};

static rosidl_message_type_support_t _GetPointMapROI_Response__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_GetPointMapROI_Response,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, map_msgs, srv, GetPointMapROI_Response)() {
  return &_GetPointMapROI_Response__type_support;
}

#if defined(__cplusplus)
}
#endif

#include "rosidl_typesupport_fastrtps_cpp/service_type_support.h"
#include "rosidl_typesupport_cpp/service_type_support.hpp"
// already included above
// #include "rosidl_typesupport_fastrtps_c/identifier.h"
// already included above
// #include "map_msgs/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "map_msgs/srv/get_point_map_roi.h"

#if defined(__cplusplus)
extern "C"
{
#endif

static service_type_support_callbacks_t GetPointMapROI__callbacks = {
  "map_msgs::srv",
  "GetPointMapROI",
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, map_msgs, srv, GetPointMapROI_Request)(),
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, map_msgs, srv, GetPointMapROI_Response)(),
};

static rosidl_service_type_support_t GetPointMapROI__handle = {
  rosidl_typesupport_fastrtps_c__identifier,
  &GetPointMapROI__callbacks,
  get_service_typesupport_handle_function,
};

const rosidl_service_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__SERVICE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, map_msgs, srv, GetPointMapROI)() {
  return &GetPointMapROI__handle;
}

#if defined(__cplusplus)
}
#endif
