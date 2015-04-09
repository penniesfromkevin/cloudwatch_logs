template node['cloudwatch_logs']['cfg_file'] do
  source "cloudwatch_logs.cfg.erb"
  owner "root"
  group "root"
  mode 0644
end
