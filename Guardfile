guard :spork, :cucumber => false do
  notification 'terminal_notifier'
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb')      { :rspec }
end

guard :rspec, cmd: 'bundle exec rspec --drb --format documentation', all_after_pass: true, all_on_start: true do
  notification 'terminal_notifier'
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')      { "spec" }
end

guard :cucumber, :cli => "--no-profile --tags ~@wip,@now --format progress", :all_on_start => false do
  notification 'terminal_notifier'
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})  { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end
