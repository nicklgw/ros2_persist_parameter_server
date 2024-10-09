启动持久化节点服务
ros2 launch parameter_server parameter_server.launch.py

设置两次才会保存到对应的yaml文件中
ros2 param set /parameter_server persistent.some_int 87
ros2 param set /parameter_server persistent.some_int 87

ros2 param set /parameter_server persistent.lock_request 1 # 锁机请求字段   锁机1, 解锁0
ros2 param set /parameter_server persistent.lock_request 1 # 锁机请求字段   锁机1, 解锁0

观察yaml配置文件中，对应的字段是否修改
cat /home/nick/zhengping_ws/params_server_ws/install/parameter_server/share/parameter_server/param/parameters_via_launch.yaml

ros2 param dump /parameter_server

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
