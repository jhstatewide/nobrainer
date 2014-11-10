module NoBrainer::Criteria::Nearest
  extend ActiveSupport::Concern

  included { criteria_option :nearest_point, :nearest_options, :merge_with => :set_scalar }

  def nearest(point, options)
    chain(:nearest_point => point, :nearest_options => options, :ordering_mode => :disabled)
  end

  def compile_rql_pass1
    rql = super
    if @options[:nearest_point] && @options[:nearest_options]
      rql = rql.get_nearest(@options[:nearest_point].to_rql, @options[:nearest_options])
      rql = rql.map {|res| res['doc']}
    end
    rql
  end
end