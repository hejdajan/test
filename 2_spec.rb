control "cis-1-2-2" do
  impact 1.0
  title "1.2.2 Verify that gpgcheck is Globally Activated (Scored)"
  desc "The gpgcheck option, found in the main section of the /etc/yum.conf file determines if an RPM package's signature is always checked prior to its installation."
  describe file('/etc/yum.conf') do
  its('content') { should match /gpgcheck=1/ }
end
end

control "cis-1-3-1" do
  impact 1.0
  title "1.3.1 Install AIDE (Scored)"
  desc "In some installations, AIDE is not installed automatically."
  describe command ('rpm -q aide') do
its ('stdout') { should_not match /aide is not installed/ }
end
end

control "cis-1-3-2" do
  impact 1.0
  title "1.3.2 Implement Periodic Execution of File Integrity (Scored)"
  desc "Implement periodic file checking, in compliance with site policy."
  describe command ('crontab -u root -l | grep aide') do
its ('stdout') { should match /0 5/ }
end
end

control "cis-1-5-1" do
  impact 1.0
  title "1.5.1 Set User/Group Owner on /etc/grub.conf (Scored)"
  desc "Setting the owner and group to root prevents non-root users from changing the file."
  describe file ('/etc/grub.conf') do
its ('owner') { should eq 'root'}
its ('group') { should eq 'root'}
end
end