# Angular Gem Store

This is a continuation of the angular gem store from the Code School course
"Shaping up with Angular". It has been completely converted to serve data
from the database, including relational data for reviews and images,
using Rails as an API. It also implements a basic search
functionality which allows querying for gems above a certain price.

```
localhost:3000?price=expensive => returns only gems over $1000
```

Authentication is done with Devise on the back end, communicated with via json.
Products can only be altered by admins.

Sign up to try it out at:

```
localhost:3000/#/admins
```

[Production App](https://angular-gem-store.herokuapp.com/)
