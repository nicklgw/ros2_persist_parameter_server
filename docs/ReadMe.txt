设置两次才会保存到对应的yaml文件中
nick@nick-dell:~/ros2_persist_parameter_server_ws/src/ros2_persist_parameter_server$ ros2 param set /parameter_server persistent.some_int 87
nick@nick-dell:~/ros2_persist_parameter_server_ws/src/ros2_persist_parameter_server$ ros2 param set /parameter_server persistent.some_int 87
观察yaml配置文件中，对应的字段是否修改
nick@nick-dell:~$ cat /home/nick/ros2_persist_parameter_server_ws/src/ros2_persist_parameter_server/server/param/parameter_server.yaml
