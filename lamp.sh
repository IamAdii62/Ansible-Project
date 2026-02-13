---
- name: Deploy LAMP Stack
  hosts: web
  become: yes

  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes

    - name: Install Apache, MySQL, PHP
      apt:
        name:
          - apache2
          - mysql-server
          - php
          - libapache2-mod-php
          - php-mysql
        state: present

    - name: Start and enable Apache
      service:
        name: apache2
        state: started
        enabled: yes

    - name: Deploy custom index page
      copy:
        content: "<h1>Deployed via Ansible Automation 🚀</h1>"
        dest: /var/www/html/index.html
