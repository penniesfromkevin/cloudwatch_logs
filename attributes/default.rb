default['cloudwatch_logs'][:aws_region] = 'us-west-2'
default['cloudwatch_logs']['log_groups'] = [
  {
    'name' => 'aws_agent',
    'file' => '/var/log/awslogs.log'
  }
]
# If this is empty, the template version of the setup file will be used.
default['cloudwatch_logs'][:aws_agent_url] = 'https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py'

# Is there such a thing as over-parameterization?
default['cloudwatch_logs']['log_file'] = '/var/log/awslogs.log'
default['cloudwatch_logs'][:cfg_file] = '/tmp/cloudwatch_logs.cfg'
default['cloudwatch_logs'][:agent_dir] = '/opt/aws/cloudwatch_logs'
default['cloudwatch_logs']['log_group_defaults'] = {
  'datetime_format' => '%d/%b/%Y:%H:%M:%S',
  'buffer_duration' => 5000,
  'log_stream_name' => '{hostname}',
  'initial_position' => 'end_of_file'
}
