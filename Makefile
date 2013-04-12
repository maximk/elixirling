
PROJ_NAME := elixirling

me:
	mix
	mix lingex.build_image
	rsync vmling dom0::images/$(PROJ_NAME).img

em:
	mix
	mix lingex.build_image
	rsync vmling dom0::images/$(PROJ_NAME).img

start:
	virsh -c xen+tcp://dom0 create --console $(PROJ_NAME).xml

console:
	virsh -c xen+tcp://dom0 console $(PROJ_NAME)

stop:
	virsh -c xen+tcp://dom0 destroy $(PROJ_NAME)

