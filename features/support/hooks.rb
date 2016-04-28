
module MyApp
  def self.failed_steps
    @@failed_steps ||= []
  end
end

Before do |scenario|

end

After do |scenario|

  $stderr.puts ""
  $stderr.puts "These steps failed:"
  MyApp.failed_steps.each do |step|
    $stderr.puts step
    $sterr.flush
  end
end

