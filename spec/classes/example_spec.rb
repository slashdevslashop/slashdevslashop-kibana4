require 'spec_helper'

describe 'kibana4' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "kibana4 class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kibana4::params') }
          it { is_expected.to contain_class('kibana4::install').that_comes_before('kibana4::config') }
          it { is_expected.to contain_class('kibana4::config') }
          it { is_expected.to contain_class('kibana4::service').that_subscribes_to('kibana4::config') }

          it { is_expected.to contain_service('kibana4') }
          it { is_expected.to contain_package('kibana4').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'kibana4 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('kibana4') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
