import React, {useContext} from 'react';
import { NavigationContainer } from '@react-navigation/native';

import { AccountNavigation } from '../account/AccountNavigation';
import { NewsNavigation } from '../news/NewsNavigation';

import { AccountContext } from '../account/AccountContext';

export const Navigation = () => {
    const {isLoggedIn} = useContext(AccountContext);

    return (
        <NavigationContainer>
            {isLoggedIn ? <NewsNavigation/> : <AccountNavigation/>}
        </NavigationContainer>
    )
}