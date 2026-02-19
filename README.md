# 🚀 Ansible LAMP Deployment on AWS EC2

## 📌 Project Overview

This project demonstrates automated deployment of a LAMP Stack (Linux, Apache, MySQL, PHP) on AWS EC2 instances using Ansible with a role-based architecture.

The goal of this project is to implement Infrastructure as Code (IaC) principles and automate server configuration in a scalable and idempotent manner.

---

## 🏗 Architecture

- 1 Ansible Control Node (Ubuntu EC2)
- 1 Managed Node (Web Server EC2)
- SSH Key-based Authentication
- Private IP Communication within same VPC
- Role-based Ansible structure

---

## 🛠 Technologies Used

- Ubuntu 24.04
- AWS EC2
- Ansible
- Apache2
- MySQL Server
- PHP
- SSH

---

## 📂 Project Structure

```
ansible-lamp-deployment-aws/
│
├── inventory
├── site.yml
├── README.md
│
└── lamp-role/
    ├── tasks/
    │   └── main.yml
```

---

## ⚙ Setup Instructions

### 1️⃣ Install Ansible on Control Node

```bash
sudo apt update
sudo apt install ansible -y
```

---

### 2️⃣ Configure Inventory File

Create a file named `inventory`:

```ini
[web]
10.0.1.67 ansible_user=ubuntu
```

Test connectivity:

```bash
ansible -i inventory web -m ping
```

Expected Output:

```
SUCCESS => pong
```

---

### 3️⃣ Deploy LAMP Stack

Run the playbook:

```bash
ansible-playbook -i inventory site.yml
```

---

## 📜 Sample Playbook (site.yml)

```yaml
---
- hosts: web
  become: yes
  roles:
    - lamp-role
```

---

## 📜 Role Tasks (lamp-role/tasks/main.yml)

```yaml
- name: Update apt
  apt:
    update_cache: yes

- name: Install Apache, MySQL and PHP
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

- name: Create index page
  copy:
    content: "<h1>Role Based LAMP Deployment 🚀</h1>"
    dest: /var/www/html/index.html
```

---

## 🌍 Verification

Open browser:

```
http://<EC2-Public-IP>
```

You should see:

```
Role Based LAMP Deployment 🚀
![Uploading image.png…]()

```

---

## 🔥 Key DevOps Concepts Implemented

- Agentless Automation
- Infrastructure as Code (IaC)
- Idempotency
- Role-Based Ansible Architecture
- SSH Key Authentication
- Service Management Automation

---

## 📈 Future Improvements

- Add Variables & Handlers
- Automate MySQL Database Configuration
- Add Nginx Load Balancer
- Integrate CI/CD Pipeline
- Provision EC2 using Terraform

---

## 👩‍💻 Author

Aditi  
DevOps & Cloud Enthusiast 🚀
