install:
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install -y ansible

provision:
	ansible-playbook playbook.prod.yml

provision-dev:
	ansible-playbook playbook.dev.yml

ffmpeg:
	./scripts/install_ffmpeg.sh
