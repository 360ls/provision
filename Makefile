install:
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install -y ansible
	ansible-galaxy install -r roles.txt
	bash scripts/install_node.sh

provision:
	ansible-playbook playbook.prod.yml

provision-dev:
	ansible-playbook playbook.dev.yml
