require "spec_helper"

RSpec.describe Fume::Nav::NavTag do
  let(:context) { double :context }
  let(:current) { nil }
  let(:attributes) { { helper: context, current: current, active_class: "active", hide_if_empty: true } }
  subject { described_class.new(attributes) }

  describe "#li_tag" do
    let(:current) { :foo }

    context "then match" do
      before { expect(context).to receive(:content_tag).with(:li, hash_including(class: "active")) }
      it { subject.li_tag(:foo) }

      context "value is Regexp" do
        let(:current) { :foo }
        it { subject.li_tag(/^foo/) }
      end

      context "value is Array" do
        let(:current) { [ :foo, 123 ] }
        it { subject.li_tag([ :foo, "123" ]) }
      end
    end

    context "then not match" do
      before { expect(context).to receive(:content_tag).with(:li, hash_excluding(class: "active")) }
      it { subject.li_tag(:not_match) }
    end
  end

  describe "#link_to" do
    before { expect(context).to receive(:link_to).with("TEXT", [:root], hash_excluding(class: "active")) }
    it { subject.link_to :foo, "TEXT", [:root] }
  end

  describe "#apply_content" do
    context "then match" do
      let(:current) { :foo }
      before { expect(context).to receive(:capture).with("active") }
      it { subject.apply_content(:foo) { |cls| } }
    end

    context "then not match" do
      before { expect(context).to receive(:capture).with(nil) }
      it { subject.apply_content(:foo) { |cls| } }
    end
  end
end
