#!/bin/bash
# {{ template_run_date }}

{% for interface in ansible_interfaces | sort %}

{% if ansible_facts[interface]['macaddress'] is defined %}
# netplan set ethernets.{{ interface }}.match.macaddress={{ ansible_facts[interface]['macaddress'] }}
# netplan set ethernets.{{ interface }}.set-name={{ interface }}
# netplan set ethernets.{{ interface }}.addresses=["{{ ansible_default_ipv4.address }}/{{ ansible_default_ipv4.prefix }}"]
# netplan set ethernets.{{ interface }}.routes='[{to: "default", via: "{{ ansible_default_ipv4.gateway }}"}]'
# netplan set ethernets.{{ interface }}.routes='[{to: "{{ ansible_default_ipv4.network}}/{{ ansible_default_ipv4.prefix }}", via: "{{ ansible_default_ipv4.gateway }}"}]'
{% endif %}
# netplan set ethernets.{{ interface }}.accept-ra=false
# netplan set ethernets.{{ interface }}.dhcp4=false
# netplan set ethernets.{{ interface }}.dhcp6=false
# netplan set ethernets.{{ interface }}.dhcp4-overrides.use-routes=false
# netplan set ethernets.{{ interface }}.dhcp6-overrides.use-routes=false
# netplan set ethernets.{{ interface }}.nameservers.addresses=["x"]

{% endfor %}

# {{ template_run_date }}

