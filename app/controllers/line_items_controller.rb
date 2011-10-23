######################################################
# LongPH - Oct 22nd, 2011
#    create file
######################################################
class LineItemsController < ApplicationController
  
  ######################################################
  # GET /line_items
  # GET /line_items.xml
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  ######################################################
  # GET /line_items/1
  # GET /line_items/1.xml
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  ######################################################
  # GET /line_items/new
  # GET /line_items/new.xml
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  ######################################################
  # GET /line_items/1/edit
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def edit
    @line_item = LineItem.find(params[:id])
  end

  ######################################################
  # POST /line_items
  # POST /line_items.xml
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def create
    @line_item = LineItem.new(params[:line_item])

    respond_to do |format|
      if @line_item.save
        flash[:notice] = 'LineItem was successfully created.'
        format.html { redirect_to(@line_item) }
        format.xml  { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  ######################################################
  # PUT /line_items/1
  # PUT /line_items/1.xml
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        flash[:notice] = 'LineItem was successfully updated.'
        format.html { redirect_to(@line_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  ######################################################
  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def destroy
    @line_item = LineItem.find(params[:id])
    #@line_item.destroy
    @line_item.status = "Deleted"

    respond_to do |format|
      format.html { redirect_to(line_items_url) }
      format.xml  { head :ok }
    end
  end
end
