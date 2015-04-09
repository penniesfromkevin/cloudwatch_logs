directory node['cloudwatch_logs']['agent_dir'] do
  recursive true
end

remote_file "#{node['cloudwatch_logs']['agent_dir']}/awslogs-agent-setup.py" do
  source node['cloudwatch_logs']['aws_agent_url']
  mode "0755"
end

execute "Install CloudWatch Logs agent" do
  command "#{node['cloudwatch_logs']['agent_dir']}/awslogs-agent-setup.py -n -r #{node['cloudwatch_logs']['aws_region']} -c #{node['cloudwatch_logs']['cfg_file']}"
  not_if { system "pgrep -f aws-logs-agent-setup" }
end
