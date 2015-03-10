require 'spec_helper'

describe 'kibana4' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        
        let(:facts) do
          facts
        end

        context "kibana4 class with no parameters" do
        
         let(:params) {{  }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kibana4') }
          it { is_expected.to contain_class('kibana4::params') }
          it { is_expected.to contain_class('kibana4::config') }
          it { is_expected.to contain_class('kibana4::install').that_comes_before('kibana4::config') }
          it { is_expected.to contain_class('kibana4::service').that_subscribes_to('kibana4::config') }

          it { should have_archive_resource_count(1) }
          it { should have_archive__download_resource_count(1) }
          it { should have_archive__extract_resource_count(1) }

          it { is_expected.to contain_exec('download archive kibana4.tgz and check sum') }
          it { is_expected.to contain_exec('download digest of archive kibana4.tgz') }
          it { is_expected.to contain_exec('kibana4 unpack') }
          it { is_expected.to contain_exec('rm-on-error-kibana4.tgz') }
         
          it { is_expected.to contain_service('kibana4') }
          it { is_expected.to contain_package('curl') }

        end

        context "kibana4 class with parameters" do
        
         let(:params) {{ 
              :version => "1.0.1",
              :arch => "x64",
              }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kibana4') }
          it { is_expected.to contain_class('kibana4::params') }
          it { is_expected.to contain_class('kibana4::config') }
          it { is_expected.to contain_class('kibana4::install').that_comes_before('kibana4::config') }
          it { is_expected.to contain_class('kibana4::service').that_subscribes_to('kibana4::config') }
          it { is_expected.to contain_archive('kibana4') }
          it { is_expected.to contain_archive__download('kibana4.tgz') }
          it { is_expected.to contain_archive__extract('kibana4') }

          it { should have_archive_resource_count(1) }
          it { should have_archive__download_resource_count(1) }
          it { should have_archive__extract_resource_count(1) }

          it { is_expected.to contain_exec('download archive kibana4.tgz and check sum') }
          it { is_expected.to contain_exec('download digest of archive kibana4.tgz') }
          it { is_expected.to contain_exec('kibana4 unpack') }
          it { is_expected.to contain_exec('rm-on-error-kibana4.tgz') }
         
          it { is_expected.to contain_service('kibana4') }
          it { is_expected.to contain_package('curl') }

        end

        context 'unsupported operating system with no parameters' do
            describe 'kibana4 class without any parameters on Solaris/Nexenta' do
              let(:facts) {{
                :osfamily        => 'Solaris',
                :operatingsystem => 'Nexenta',
              }}


            it { expect { is_expected.to contain_package('kibana4') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
          end
        end

        context 'unsupported operating system with parameters' do
          describe 'kibana4 class with parameters on Solaris/Nexenta' do
            let(:facts) {{
              :osfamily        => 'Solaris',
              :operatingsystem => 'Nexenta',
            }}
            let(:params) {{ 
                    :version => "1.0.1",
                    :arch => "x64",
                    }}
            it { expect { is_expected.to contain_package('kibana4') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
          end
        end

      end
    end
  end
end