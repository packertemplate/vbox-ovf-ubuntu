#Makefile
#atlas username, this requires ATLAS_TOKEN set
username = alvaro
# ie sufix = -project
sufix = 

# start
.Phony: all
OS = precise trusty vivid wily
OSDIR := $(foreach os, $(OS), $(os)/)
OVF := $(foreach os, $(OS), $(os)/box.ovf)
BOXES := $(foreach os, $(OS), $(os).box)

all: $(OVF) $(BOXES)

list:
	@echo $(BOXES)

clean:
	-@rm *.box

cleanall:
	-rm -fr $(OSDIR)

%.box:
	packer build -var "os=$(@:.box=)" -var "username=$(username)" -var "vm_name=$(@:.box=$(sufix))" template.json

#12.04
precise/box.ovf:
	-@mkdir -p precise/
	-@curl -sSL -k https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box | tar xv -C source/precise/

#14.04
trusty/box.ovf:
	-@mkdir -p trusty/
	-@curl -sSL -k https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box | tar xv -C source/trusty/

#15.04
vivid/box.ovf:
	-@mkdir -p vivid/
	-@curl -sSL -k https://cloud-images.ubuntu.com/vagrant/vivid/current/vivid-server-cloudimg-amd64-vagrant-disk1.box | tar xv -C source/vivid/

#15.10
wily/box.ovf:
	-@mkdir -p wily/
	-@curl -sSL -k https://cloud-images.ubuntu.com/vagrant/wily/current/wily-server-cloudimg-amd64-vagrant-disk1.box | tar xv -C source/wily/


#16.04 beta
xenial/box.ovf:
	-@mkdir -p xenial/
	-@curl -sSL -k https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box | tar xv -C source/xenial/
