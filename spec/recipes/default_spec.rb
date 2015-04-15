require 'chefspec'

describe 'ossec-server::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'includes the packages recipe' do
    expect(chef_run).to include_recipe('ossec-server::packages')
  end

  it 'includes the configuration recipe' do
    expect(chef_run).to include_recipe('ossec-server::configuration')
  end

  # webui.rb not yet implemented
  it 'does not include the webui recipe' do
    expect(chef_run).to_not include_recipe('ossec-server::webui')
  end
end
