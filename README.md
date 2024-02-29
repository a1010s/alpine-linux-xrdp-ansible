# **Alpine Linux Configuration with Xfce Desktop & DevOps tools**

This repository provides an Ansible playbook for configuring Alpine Linux with the Xfce desktop environment, xrdp, and kubectl. Below are the steps and configurations included in the playbook.

## **Prerequisites**
Before running the playbook, make sure to preconfigure your Alpine Linux system with the following:

- **Enable community repositories**.
- **Install Python 3** (`apk add python3`).
- **Install sudo** (`apk add sudo`).

## **User Setup**
To add a new user and grant sudo permissions, follow these steps:

```bash
apk add sudo
NEWUSER='yourUserName'
adduser -g "${NEWUSER}" $NEWUSER
echo "$NEWUSER ALL=(ALL) ALL" > /etc/sudoers.d/$NEWUSER && chmod 0440 /etc/sudoers.d/$NEWUSER
```
Replace 'yourUserName' with the desired username.

## **Ansible Playbook**

The Ansible playbook included in this repository automates the configuration process. Here's what it does:

- **Setup community repositories**.
- **Update repositories**.
- **Upgrade packages**.
- **Copy .bashrc and .vimrc configuration files**.
- **Install necessary packages** including Xfce desktop, xrdp, and other utilities.
- **Run setup-devd and udev commands**.
- **Start and enable lightdm service**.
- **Start and enable xrdp and xrdp-sesman services**.
- **Create a symbolic link from vim to vi**.
- **Add lightdm, xrdp, and xorgxrdp to the default runlevel**.

## **Running the Playbook**

To execute the playbook, use the provided YAML file and ensure Ansible is installed on your system. Simply run:

```bash
ansible-playbook -i inventory -u $USER configure_alpine-xrdp.yml
```

## **Notes**

- **Please review and customize the playbook according to your specific requirements before running it.**
- **Some packages might fail to install due to unavailability or dependency issues. You can ignore these errors by setting `ignore_errors: yes`.**
- **Optionally, you can uncomment the "Reboot the system" task if you want the system to reboot automatically after configuration.**
- **Feel free to contribute or provide feedback to improve this playbook!**

