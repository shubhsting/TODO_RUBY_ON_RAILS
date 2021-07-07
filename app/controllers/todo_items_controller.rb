class TodoItemsController < ApplicationController
    # will run set todo list first
    before_action:set_todo_list
    # create that item into the list from below 2 functions
    def create
        @todo_item=@my_list.todo_items.create(todo_items_params_content)
        redirect_to(@my_list);
    end

    private
    # find the list from list id in params
    def set_todo_list
        @my_list=MyList.find(params[:my_list_id])
    end
    # find the content of todo item from params id
    def todo_items_params_content
        params[:todo_item].permit(:content);
    end

end
