启动持久化节点服务
ros2 run parameter_server server --file-path /home/nick/ros2_persist_parameter_server_ws/src/ros2_persist_parameter_server/server/param/parameter_server.yaml

设置两次才会保存到对应的yaml文件中
nick@nick-dell:~/ros2_persist_parameter_server_ws/src/ros2_persist_parameter_server$ ros2 param set /parameter_server persistent.some_int 87
nick@nick-dell:~/ros2_persist_parameter_server_ws/src/ros2_persist_parameter_server$ ros2 param set /parameter_server persistent.some_int 87
观察yaml配置文件中，对应的字段是否修改
nick@nick-dell:~$ cat /home/nick/ros2_persist_parameter_server_ws/src/ros2_persist_parameter_server/server/param/parameter_server.yaml


nick@nick-dell:~/ros2_persist_parameter_server_ws/src/ros2_persist_parameter_server$ ros2 param dump /parameter_server
/parameter_server:
  ros__parameters:
    a_string: Hello world
    persistent:
      a_string: Hello world
      pi: 3.14156
      some_int: 1
      some_lists:
        some_integers:
        - 1
        - 2
        - 3
        - 4
    pi: 3.14
    qos_overrides:
      /parameter_events:
        publisher:
          depth: 1000
          durability: volatile
          history: keep_last
          reliability: reliable
    some_int: 1
    some_lists:
      some_integers:
      - 1
      - 2
      - 3
      - 4
    use_sim_time: false
