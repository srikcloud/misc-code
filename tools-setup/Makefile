infra:
	git pull
	terraform init
	terraform apply -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_name)-int.srikanth553.store, -e ansible_user=azureuser -e ansible_password=DevOps@123456 tools_setup.yml -e tool_name=$(tool_name)
	