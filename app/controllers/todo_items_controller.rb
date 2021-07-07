class TodoItemsController < ApplicationController
    # will run set todo list first
    before_action:set_todo_list
    before_action:set_todo_item,except:[:create]
    # create that item into the list from below 2 functions
    def create
        @todo_item=@my_list.todo_items.create(todo_items_params_content)
        redirect_to @my_list
    end

    def complete
        @todo_item.update_attribute(:completed_at,Time.now)
        redirect_to @my_list,notice:"Todo Item completed"
    end

    # function to destroy todo
    def destroy
        @todo_item=@my_list.todo_items.find(params[:id]);
        if(@todo_item.destroy)
            flash[:success]="Todo item deleted"
        else
            flash[:error]="Todo item not deleted"
        end
        redirect_to(@my_list)
    end


    private
    # find the list from list id in params
    def set_todo_list
        @my_list=MyList.find(params[:my_list_id])
    end

    #find the todo item from item id in params 
    def set_todo_item
        @todo_item=@my_list.todo_items.find(params[:id])
    end

    # find the content of todo item from params id
    def todo_items_params_content
        params[:todo_item].permit(:content);
    end

end
