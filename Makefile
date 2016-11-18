install:
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install -y ansible

provision:
	ansible-playbook playbook.prod.yml

provision-dev:
	ansible-playbook playbook.dev.yml

ffmpeg:
	chmod +x scripts/install_ffmpeg.sh
	./scripts/install_ffmpeg.sh

setup:
	chmod +x scripts/setup.sh
	./scripts/setup.sh
