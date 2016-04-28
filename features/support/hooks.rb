
module MyApp
  def self.failed_steps
    @@failed_steps ||= []
  end

  def self.passed_steps
    @@passed_steps ||= []
  end
end

Before do |scenario|

end

After do |scenario|

  fail_count = MyApp.failed_steps.count
  pass_count = MyApp.passed_steps.count
  total = fail_count + pass_count

  $stdout.puts
  $stdout.puts MyApp::Color.magenta("### Results ###")
  $stdout.puts

  if fail_count == 0
    $stdout.puts MyApp::Color.green("#{pass_count} of #{total} steps passed")
  else
    $stdout.puts MyApp::Color.red("#{fail_count} of #{total} steps failed")
    $stdout.puts
    $stdout.puts MyApp::Color.red("These steps failed:")
    $stdout.puts

    counter = 1
    MyApp.failed_steps.each do |step|
      $stdout.puts MyApp::Color.red("#{counter}. #{step}")
      $stdout.flush
      counter = counter + 1
    end
  end
end

