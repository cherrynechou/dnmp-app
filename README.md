# dnmp-app

# 1.关闭selinux

   ```
    vim /etc/selinux/config
    SELINUX=disable
   ```

2.  编辑sysctro.conf

   ```
   vm.overcommit_memory = 1
   ```