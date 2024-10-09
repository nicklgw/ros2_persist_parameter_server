编译
colcon build --packages-select parameter_server

启动持久化节点服务
ros2 launch parameter_server parameter_server.launch.py

设置两次才会保存到对应的yaml文件中
ros2 param set /parameter_server persistent.some_int 87
ros2 param set /parameter_server persistent.some_int 87

ros2 param set /parameter_server persistent.lock_request 1 # 锁机请求字段   锁机1, 解锁0
ros2 param set /parameter_server persistent.lock_request 1 # 锁机请求字段   锁机1, 解锁0

观察yaml配置文件中，对应的字段是否修改
cat /home/nick/zhengping_ws/params_server_ws/install/parameter_server/share/parameter_server/param/parameters_via_launch.yaml

查看参数
ros2 param dump /parameter_server

bzlrobot@raspberrypi:~$ ros2 param dump /parameter_server
/parameter_server:
  ros__parameters:
    a_string: Hello world
    persistent:
      a_string: Hello world
      lock_request: 0
      pi: 3.14
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


打包
$ bloom-generate rosdebian
$ fakeroot debian/rules binary

安装自启脚本
bzlrobot@raspberrypi:/opt/ros/humble/share/parameter_server/launch$ sudo install -Dm644 parameter_server.service  /usr/lib/systemd/system/parameter_server.service

服务管理的常用操作

#重新使能服务
systemctl enable parameter_server.service
# 启动服务：
systemctl start parameter_server.service
# 关闭服务：
systemctl stop parameter_server.service
# 重启服务：
systemctl restart parameter_server.service
# 显示服务状态：
systemctl status parameter_server.service
# 禁用服务开机启动：
systemctl disable parameter_server.service

systemctl daemon-reload
systemctl start parameter_server.service

查看system.service自启服务日志
journalctl -n 100 -u parameter_server.service

bzlrobot@raspberrypi:/opt/ros/humble/share/parameter_server/param$ sudo chmod 0777 parameters_via_launch.yaml
bzlrobot@raspberrypi:/opt/ros/humble/share/parameter_server/launch$ sudo mkdir -m a=rwx -p /var/log/bzlrobot/parameter_server
