# everestwalktest

This project uses TMDB api to create an flutter application

## Steps to run the project
- Clone the project
- Open in any prefered code editor
- Run flutter pub get
- Use the following command in terminal to fix code generation issue<br>
  flutter pub run build_runner watch --delete-conflicting-outputs<br>
  or<br>
  flutter pub run build_runner build --delete-conflicting-outputs
- if the movies are not being fetched please check the api key inside the .env folder of the project and ensure the key is correct
