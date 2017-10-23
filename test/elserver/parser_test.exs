defmodule Elserver.ParserTest do 
  use ExUnit.Case
    test "it should parse the request into a map" do 
      request = """
      Get /wildthings HTTP/1.1
      Host: example.com 
      User-Agent: ExampleBrowser/1.0
      Accept: */*

      """

      assert Elserver.Parser.parse(request) == %{method: "Get", path: "/wildthings", resp_body: "", status: nil}
  end


 
end 
