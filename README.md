# dnmp-app

###### 1.关闭selinux

   ```
    vim /etc/selinux/config
    SELINUX=disabled
   ```

###### 2.编辑sysctrl.conf

```
vim /etc/sysctl.conf
vm.overcommit_memory = 1
```