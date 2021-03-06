defmodule Elserver.PledgeController do 

  import Elserver.View, only: [render: 3]


  def create(conv, %{"name" =>  name, "amount" =>  amount}) do
    #send pledge to persistenent
    Elserver.PledgeServer.create_pledge(name, String.to_integer(amount))
    %{ conv  | status: 201, resp_body: "Thank you #{name} for pledging #{amount}" }
  end

  def new(conv) do 
    render(conv, "new_pledge.eex", [])
  end 

  def index(conv) do
    #get some recent pledges from cache
    pledges = Elserver.PledgeServer.recent_pledges 
    render(conv, "pledges.eex", pledges: pledges)
  end 
end 
