# dnmp-app

###### 1.关闭selinux

   ```
    方法一：vim /etc/selinux/config
    SELINUX=disabled

    方法二：sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
   ```

###### 2.编辑sysctrl.conf

```
vim /etc/sysctl.conf
vm.overcommit_memory = 1
```

######   注：docker里面容器可以通过 host.docker.internal 来访问宿主机，而podman容器里面是通过 host.containers.internal 来访问宿主机