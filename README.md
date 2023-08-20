# MeowNews App

Small news viewer application.

## Project settings
To get and display a list of news, the resource API [newsapi](https://newsapi.org) is used.

## Errors
- If an error occurs `Error server api: 400`: 
Query parameters are set incorrectly. It may occur if you manually change the parameters of the GET request.

- If an error occurs `Error server api: 401`: 
The current API key is no longer working. 
How to fix: 
  Go to the site [newsapi](https://newsapi.org) and get a new Api key.
  Change the API key parameter in the file `ConfigRequestServer.dart`

- If an error occurs `Error server api: 429`:
  Too many API requests made. Access will be restored after a while.
  To fix it, select another API key in the `ConfigRequestServer.dart` file or create your own.

- Errors with launching and working with the platform are given in [Issues](https://github.com/KubrickRubrik/MeowNews-App/issues).





## Used packages and plugins

<table>
<tr>
 <th>Purpose</th> <th>Source</th> <th>Purpose</th> <th>Source</th>
</tr>
 <tr>
    <td>Localization (en,ru)</td>         <td><a href='https://pub.dev/packages/intl'>intl</a></td>
   <td>Screen layout check</td>         <td><a href='https://pub.dev/packages/device_preview'>device_preview</a></td>
 </tr> 
 <tr>
   <td>State manager</td>                <td><a href='https://pub.dev/packages/provider'>provider</a>     </td>
   <td>Service Locator</td>              <td><a href='https://pub.dev/packages/get_it'>get_it</a>     </td>
 </tr>

 <tr>
   <td>Networking</td>                   <td><a href='https://pub.dev/packages/http'>http</a>    </td>
    <td>Local storage</td>              <td><a href='https://pub.dev/packages/shared_preferences'>shared_preferences</a></td>
 </tr>

</table>
