#!/bin/bash
# {{ template_run_date }}

{% for interface in ansible_interfaces | sort %}

{% if ansible_facts[interface]['macaddress'] is defined %}

# {{ ansible_facts[interface]['ipv4'] }}
# netplan set ethernets.{{ interface }}.match.macaddress={{ ansible_facts[interface]['macaddress'] }}
# netplan set ethernets.{{ interface }}.set-name={{ interface }}
{% endif %}

# netplan set ethernets.{{ interface }}.addresses=[""]
# netplan set ethernets.{{ interface }}.routes='[{to: "default", via: ""}]'
# netplan set ethernets.{{ interface }}.accept-ra=false
# netplan set ethernets.{{ interface }}.dhcp4=false
# netplan set ethernets.{{ interface }}.dhcp6=false
# netplan set ethernets.{{ interface }}.dhcp4-overrides.use-routes=false
# netplan set ethernets.{{ interface }}.dhcp6-overrides.use-routes=false
# netplan set ethernets.{{ interface }}.nameservers.addresses=[""]

{% endfor %}

# {{ template_run_date }}
