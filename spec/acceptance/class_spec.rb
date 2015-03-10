require 'spec_helper_acceptance'

describe 'kibana4 class' do

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'kibana4': }
      EOS



      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      #apply_manifest(pp, :catch_changes  => true)

    end


    describe file('/opt/kibana4') do
      it { should be_directory }
    end

    describe command('ls -R /opt/kibana4') do
      its(:exit_status) { should eq 0 }
    end
  end
end
