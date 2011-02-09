require 'spec_helper'

describe "Definition" do
  
  let(:definition_dsl) {Streama::DefinitionDSL.new(:new_enquiry)}
  
  it "Should initialize with name" do
    definition_dsl.attributes[:name].should eq :new_enquiry
  end
  
  it "should add an actor to the definition" do
    dsl = definition_dsl
    dsl.actor(:user, :store => [:id, :full_name])
    dsl.attributes[:actor].should eq :user => { :store=>[:id, :full_name] }
  end
  
  it "should add multiple actors to the definition" do
    dsl = definition_dsl
    dsl.actor(:user, :store => [:id, :full_name])
    dsl.actor(:company, :store => [:id, :name])
    dsl.attributes[:actor].should eq :user => { :store=>[:id, :full_name] }, :company => { :store=>[:id, :name] }
  end
  
  it "should add a target to the definition" do
    dsl = definition_dsl
    dsl.target(:listing, :store => [:id, :title])
    dsl.attributes[:target].should eq :listing => { :store=>[:id, :title] }
  end

  it "should add a referrer to the definition" do
    dsl = definition_dsl
    dsl.referrer(:company, :store => [:id, :name])
    dsl.attributes[:referrer].should eq :company => { :store=>[:id, :name] }
  end
  
end