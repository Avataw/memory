defmodule MemoryWeb.GameHTML do
  use MemoryWeb, :html

  embed_templates "game_html/*"

  def display_code(language) do
    case language do
      "java" ->
        """
        public class Main {
          public static void main(String[] args) {
            System.out.println("Hello World!");
          }
        }
        """

      "ruby" ->
        """
        puts ["Hello", "World!"].join(' ')
        """

      "haskell" ->
        """
        main :: IO ()
        main = putStrLn . concat $ [\"Hello\", \"World!\"]
        """

      "javascript" ->
        """
        const print = (str) =>
          console.log("Hello " + str);

        const main = print("World!");
        """

      "python" ->
        """
        def main(name = 'world'):
          print(f'hello {name}!')
        """

      "go" ->
        """
        package main
        import "fmt"

        func main() {
          fmt.Print("Hello World!")
        }
        """

      "c" ->
        """
        #include <stdio.h>
        #define HELLO "Hello "
        #define WORLD "World!"

        int main() {
            printf(HELLO WORLD);
            return 0;
        }
        """

      "rust" ->
        """
        fn print(s: &str) {
          println!("{}", s);
        }

        fn main() {
          let hello = "World!";
          print(&hello);
        }
        """

      _ ->
        "something went wrong"
    end
  end
end
