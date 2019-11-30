require "spec_helper"
require "action_view"

RSpec.describe Fume::Nav::HelperExt do
  class TestView < ::ActionView::Base
    include Fume::Nav::HelperExt
  end

  let(:controller) { ActionView::TestCase::TestController.new }
  let(:view) { TestView.new }
  before { view.output_buffer = ActionView::OutputBuffer.new }

  describe "#fume_nav" do
    let(:current) { :foo }
    subject { view.fume_nav(current) { |n| n.li_tag(:foo) { "foo" } } }
    it { is_expected.to include('<li class="active">foo</li>') }

    context "then hide_if_empty is true" do
      subject { view.fume_nav(current, hide_if_empty: true) { |n| "hide" } }
      it { is_expected.to eq nil }
    end

    context "then hide_if_empty is true" do
      subject { view.fume_nav(current, hide_if_empty: false) { |n| "show" } }
      it { is_expected.to eq "show" }
    end

    context "then inactive_class is set" do
      subject { view.fume_nav(current, inactive_class: "text-muted") { |n| n.li_tag(:bar) { "bar" } } }
      it { is_expected.to include('<li class="text-muted">bar</li>') }
    end
  end
end
