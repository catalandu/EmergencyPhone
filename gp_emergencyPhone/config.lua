Config = {}
Translation = {}

Config.Locale = 'de'

Config.Command = true -- enables /cards Command to open menu
Config.CommandName = "ephone"
Config.enableKeyUsage = true
Config.Key = 314 -- default (314) NUM +

--MySQL options
Config.UserTable = 'users'
Config.IdentifierTable = 'identifier'
Config.NumberTable = 'phone_number'

Config.Jobs = {
    {name = "police", lable = "LSPD", number = 911},
    {name = "offpolice", lable = "LSPD", number = 911},
    {name = "ambulance", lable = "LSMD", number = 912},
    {name = "offambulance", lable = "LSMD", number = 912},
    {name = "mechanic", lable = "Mechanic", number = 913},
    {name = "offmechanic", lable = "Mechanic", number = 913},
    {name = "bennys", lable = "Bennys", number = 914},
    {name = "offbennys", lable = "Bennys", number = 914},
    {name = "cardealer", lable = "Cardealer", number = 915},
    {name = "offcardealer", lable = "Cardealer", number = 915}
}

Translation = {

    ['de'] = {

        -- mainMenu translations
        ['menu_header'] = "Leitstelle",
        ['menu_subtitle'] = '~r~Bei Dienstende -> Leitstelle abgeben!',
        ['menu_item_inuse'] = 'Besetzung: ~g~',
        ['menu_item_claim'] = 'Leitstelle besetzen',
        ['menu_item_back'] = 'Leitstelle abgeben',
        ['menu_item_clear'] = 'Leitstelle zurücksetzten',
        ['menu_not_in_use'] = 'Leitstelle nicht besetzt.',

         -- notifyMenu translations
         ['menu2_header'] = "Mitteilungen",
         ['menu2_subtitle'] = '~r~Bei Dienstende -> Leitstelle abgeben!',
         ['menu2_item_onduty'] = 'Mitteilung an Bürger schicken',
         ['menu2_item_onduty_subtitle'] = 'Leistelle ist erreichbar...',
         ['menu2_item_offduty'] = 'Außerdienst-Mitteilung an Bürger schicken',
         ['menu2_item_offduty_subtitle'] = 'Leistelle ist nicht erreichbar...',
         ['menu2_item_break'] = 'Pause-Mitteilung an Bürger schicken',
         ['menu2_item_break_subtitle'] = 'Leistelle ist nicht erreichbar...',
         ['menu2_item_own'] = 'Benutzerdefinierte Mitteilung',
         ['menu2_item_own_subtitle'] = 'Mitteilung schreiben...',
         ['menu2_item_dialog'] = 'Gib deine Nachricht ein...',

        -- Notifications translations (Client)
        ['msg_ephone_inuse'] = '~r~Leitstelle bereits besetzt',
        ['msg_ephone_take'] = '~g~Leitstelle übernommen',
        ['msg_ephone_newNumber'] = '~g~Neue Nummer: ~w~',

        ['msg_ephone_giveback'] = '~g~Leitstelle abgegeben',
        ['msg_ephone_dont'] = '~r~Du besitzt das Leitstellentelfon nicht!',

        ['msg_ephone_notinsuse'] = '~g~Leitstelle ist nicht besetzt',
        ['msg_ephone_cleared'] = '~g~Leitstelle zurückgesetzt',

       -- Esx_Advanced_Notifications ACLS (Server)
       -- Onduty
       ['msg_mechanic_header'] = 'Leitstelle',
       ['msg_mechanic_subtitle'] = 'ACLS Leistelle',
       ['msg_mechanic_text'] = 'Wir sind für Sie im Dienst! ACLS kann nun über 913 erreicht werden!',
       ['msg_mechanic_picture'] = 'CHAR_CHAT_CALL',
       ['msg_mechanic_badged'] = 2,
       -- Break
       ['msg_mechanic_text_break'] = 'ACLS macht nun Pause! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- Offduty
       ['msg_mechanic_text_offduty'] = 'ACLS geht in den Feierabend! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- OwnMessage
       ['msg_mechanic_own_header'] = 'Leitstelle',
       ['msg_mechanic_own_subtitle'] = 'ACLS Leistelle',
    
        -- Esx_Advanced_Notifications LSPD (Server)
       -- Onduty
       ['msg_police_header'] = 'Leitstelle',
       ['msg_police_subtitle'] = 'LSPD Leistelle',
       ['msg_police_text'] = 'Sie sind in Not? Das LSPD kann nun über 911 erreicht werden!',
       ['msg_police_picture'] = 'CHAR_CALL911',
       ['msg_police_badged'] = 2,
       -- Break
       ['msg_police_text_break'] = 'Das LSPD macht Pause! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- Offduty
       ['msg_police_text_offduty'] = 'Das LSPD geht in den Feierabend! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- OwnMessage
       ['msg_police_own_header'] = 'Leitstelle',
       ['msg_police_own_subtitle'] = 'LSPD Leistelle',
   
       -- Esx_Advanced_Notifications Bennys (Server)
       -- Onduty
       ['msg_bennys_header'] = 'Leitstelle',
       ['msg_bennys_subtitle'] = 'Bennys Leistelle',
       ['msg_bennys_text'] = 'Wir sind für Sie im Dienst! Bennys kann nun über 914 erreicht werden!',
       ['msg_bennys_picture'] = 'CHAR_CHAT_CALL',
       ['msg_bennys_badged'] = 2,
       -- Break
       ['msg_bennys_text_break'] = 'Bennys macht Pause! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- Offduty
       ['msg_bennys_text_offduty'] = 'Bennys geht in den Feierabend! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- OwnMessage
       ['msg_bennys_own_header'] = 'Leitstelle',
       ['msg_bennys_own_subtitle'] = 'Bennys Leistelle',
    
       -- Esx_Advanced_Notifications LSMD (Server)
       -- Onduty
       ['msg_ambulance_header'] = 'Leitstelle',
       ['msg_ambulance_subtitle'] = 'LSMD Leistelle',
       ['msg_ambulance_text'] = 'Sie benötigen medizinische Hilfe? Das LSMD ist unter 912 erreichbar!',
       ['msg_ambulance_picture'] = 'CHAR_CALL911',
       ['msg_ambulance_badged'] = 2,
       -- Break
       ['msg_ambulance_text_break'] = 'Das LSMD macht Pause! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- Offduty
       ['msg_ambulance_text_offduty'] = 'Das LSMD geht in den Feierabend! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- OwnMessage
       ['msg_ambulance_own_header'] = 'Leitstelle',
       ['msg_ambulance_own_subtitle'] = 'LSMD Leistelle',
    
       -- Esx_Advanced_Notifications Cardealer (Server)
       -- Onduty
       ['msg_cardealer_header'] = 'Leitstelle',
       ['msg_cardealer_subtitle'] = 'Luxusautohaus Leistelle',
       ['msg_cardealer_text'] = 'Sie haben zu viel Geld? Gönnen Sie sich ein bisschen Luxus: 915!',
       ['msg_cardealer_picture'] = 'CHAR_CHAT_CALL',
       ['msg_cardealer_badged'] = 2,
       -- Break
       ['msg_cardealer_text_break'] = 'Das Luxusautohaus macht Pause! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- Offduty
       ['msg_cardealer_text_offduty'] = 'Das Luxusautohaus geht in den Feierabend! ~r~Leitstellentelefon~s~ zur Zeit ~r~nicht besetzt!',
       -- OwnMessage
       ['msg_cardealer_own_header'] = 'Leitstelle',
       ['msg_cardealer_own_subtitle'] = 'Luxusautohaus Leistelle',
    },

    ['en'] = {

        -- mainMenu translations
        ['menu_header'] = "Control Centre",
        ['menu_subtitle'] = '~r~End of duty -> Return emergency phone!',
        ['menu_item_inuse'] = 'In use: ~g~',
        ['menu_item_claim'] = 'Take emergency phone',
        ['menu_item_back'] = 'Return emergency phone',
        ['menu_item_clear'] = 'Clear emergency phone',
        ['menu_not_in_use'] = 'Control center not manned.',

         -- notifyMenu translations
         ['menu2_header'] = "Broadcast",
         ['menu2_item_onduty'] = 'Send notification to citizens',
         ['menu2_item_onduty_subtitle'] = 'Control center can be reached...',
         ['menu2_item_offduty'] = 'Send offduty notification to citizens',
         ['menu2_item_offduty_subtitle'] = 'Control center cannot be reached...',
         ['menu2_item_break'] = 'Send pause notification to citizens',
         ['menu2_item_break_subtitle'] = 'Control center cannot be reached...',
         ['menu2_item_own'] = 'Custom message',
         ['menu2_item_own_subtitle'] = 'Write a message ...',
         ['menu2_item_dialog'] = 'Enter your message ...',

        -- Notifications translations (Client)
        ['msg_ephone_inuse'] = '~r~Control center already occupied',
        ['msg_ephone_take'] = '~g~You taken the emergency phone',
        ['msg_ephone_newNumber'] = '~g~New number: ~w~',

        ['msg_ephone_giveback'] = '~g~You returned the emergency phone',
        ['msg_ephone_dont'] = '~r~You dont own the emergency phone!',

        ['msg_ephone_notinsuse'] = '~g~Emergency phone is not in use',
        ['msg_ephone_cleared'] = '~g~Control center cleared.',

       -- Esx_Advanced_Notifications ACLS (Server)
       -- Onduty
       ['msg_mechanic_header'] = 'Control center',
       ['msg_mechanic_subtitle'] = 'ACLS control center',
       ['msg_mechanic_text'] = 'We are at your service! ACLS can now be reached via 913!',
       ['msg_mechanic_picture'] = 'CHAR_CHAT_CALL',
       ['msg_mechanic_badged'] = 2,
       -- Break
       ['msg_mechanic_text_break'] = 'ACLS is now taking a break! ~s~ Control center ~r~ not occupied!',
       -- Offduty
       ['msg_mechanic_text_offduty'] = 'ACLS is closing down! ~s~ Control center ~r~ not occupied!',
       -- OwnMessage
       ['msg_mechanic_own_header'] = 'Control center',
       ['msg_mechanic_own_subtitle'] = 'ACLS control center',
    
        -- Esx_Advanced_Notifications LSPD (Server)
       -- Onduty
       ['msg_police_header'] = 'Control center',
       ['msg_police_subtitle'] = 'LSPD control center',
       ['msg_police_text'] = 'You need help? The LSPD can now be reached via 911!',
       ['msg_police_picture'] = 'CHAR_CALL911',
       ['msg_police_badged'] = 2,
       -- Break
       ['msg_police_text_break'] = 'LSPD is now taking a break! ~s~Control center ~r~not occupied!',
       -- Offduty
       ['msg_police_text_offduty'] = 'LSPD is closing down! ~s~Control center ~r~not occupied!',
       -- OwnMessage
       ['msg_police_own_header'] = 'Control center',
       ['msg_police_own_subtitle'] = 'LSPD control center',
   
       -- Esx_Advanced_Notifications Bennys (Server)
       -- Onduty
       ['msg_bennys_header'] = 'Control center',
       ['msg_bennys_subtitle'] = 'Bennys control center',
       ['msg_bennys_text'] = 'We are at your service! Bennys can now be reached via 914!',
       ['msg_bennys_picture'] = 'CHAR_CHAT_CALL',
       ['msg_bennys_badged'] = 2,
       -- Break
       ['msg_bennys_text_break'] = 'Bennys is now taking a break! ~s~Control center ~r~not occupied!',
       -- Offduty
       ['msg_bennys_text_offduty'] = 'Bennys is closing down! ~s~Control center ~r~not occupied!',
       -- OwnMessage
       ['msg_bennys_own_header'] = 'Control center',
       ['msg_bennys_own_subtitle'] = 'Bennys control center',
    
       -- Esx_Advanced_Notifications LSMD (Server)
       -- Onduty
       ['msg_ambulance_header'] = 'Control center',
       ['msg_ambulance_subtitle'] = 'LSMD control center',
       ['msg_ambulance_text'] = 'You need medical assistance? LSMD can now be reached via 912!',
       ['msg_ambulance_picture'] = 'CHAR_CALL911',
       ['msg_ambulance_badged'] = 2,
       -- Break
       ['msg_ambulance_text_break'] = 'LSMD is now taking a break! ~s~Control center ~r~not occupied!',
       -- Offduty
       ['msg_ambulance_text_offduty'] = 'LSMD is closing down! ~s~Control center ~r~not occupied!',
       -- OwnMessage
       ['msg_ambulance_own_header'] = 'Control center',
       ['msg_ambulance_own_subtitle'] = 'LSMD control center',
    
       -- Esx_Advanced_Notifications Cardealer (Server)
       -- Onduty
       ['msg_cardealer_header'] = 'Control center',
       ['msg_cardealer_subtitle'] = 'Cardealer control center',
       ['msg_cardealer_text'] = 'You have too much money? Allow yourself a little luxury: 915!',
       ['msg_cardealer_picture'] = 'CHAR_CHAT_CALL',
       ['msg_cardealer_badged'] = 2,
       -- Break
       ['msg_cardealer_text_break'] = 'Cardealer is now taking a break! ~s~Control center ~r~not occupied!',
       -- Offduty
       ['msg_cardealer_text_offduty'] = 'Cardealer is closing down! ~s~Control center ~r~not occupied!',
       -- OwnMessage
       ['msg_cardealer_own_header'] = 'Control center',
       ['msg_cardealer_own_subtitle'] = 'Cardealer control center',
    },

    ['fr'] = {

        -- mainMenu translations
        ['menu_header'] = "Centrale",
        ['menu_subtitle'] = '~r~Fin du service -> Retour de téléphone d\'urgence!',
        ['menu_item_inuse'] = 'Utilisé: ~g~',
        ['menu_item_claim'] = 'Prendre le central',
        ['menu_item_back'] = 'Retour de téléphone du central',
        ['menu_item_clear'] = 'Nettoyage Téléphone d\'urgence',
        ['menu_not_in_use'] = 'Centre de contrôle non habité.',

         -- notifyMenu translations
         ['menu2_header'] = "Diffuser",
         ['menu2_item_onduty'] = 'Envoyer une notification aux citoyens',
         ['menu2_item_onduty_subtitle'] = 'Le centre de contrôle peut être joint..',
         ['menu2_item_offduty'] = 'Envoyer une notification de fin de service',
         ['menu2_item_offduty_subtitle'] = 'Le centre de contrôle ne peut pas être joint...',
         ['menu2_item_break'] = 'Envoyer une notification de pause',
         ['menu2_item_break_subtitle'] = 'Le centre de contrôle ne peut pas être joint...',
         ['menu2_item_own'] = 'Message personnalisé',
         ['menu2_item_own_subtitle'] = 'Écrire un message ...',
         ['menu2_item_dialog'] = 'Entrez votre message ...',

        -- Notifications translations (Client)
        ['msg_ephone_inuse'] = '~r~Centre de contrôle déjà occupé',
        ['msg_ephone_take'] = '~g~Vous avez pris le téléphone d\'urgence',
        ['msg_ephone_newNumber'] = '~g~Nouveau numéro: ~w~',

        ['msg_ephone_giveback'] = '~g~Vous avez retourné le téléphone d\'urgence',
        ['msg_ephone_dont'] = '~r~Vous ne possédez pas le téléphone d\'urgence!',

        ['msg_ephone_notinsuse'] = '~g~Le téléphone d\'urgence n\'est pas utilisé',
        ['msg_ephone_cleared'] = '~g~Centre de contrôle effacé.',

       -- Esx_Advanced_Notifications ACLS (Server)
       -- Onduty
       ['msg_mechanic_header'] = 'Centrale',
       ['msg_mechanic_subtitle'] = 'Centre de contrôle ACLS',
       ['msg_mechanic_text'] = 'Nous sommes à votre service! Le garage peut maintenant être contacté en appelant le 913!',
       ['msg_mechanic_picture'] = 'CHAR_CHAT_CALL',
       ['msg_mechanic_badged'] = 2,
       -- Break
       ['msg_mechanic_text_break'] = 'Les garagistes font maintenant une pause! ~s~~Centre d\'appel ~r~non disponible temporairement!',
       -- Offduty
       ['msg_mechanic_text_offduty'] = 'Les mécanos ferment! ~s~~r~Personne de DISPONIBLE ~w~au standard!',
       -- OwnMessage
       ['msg_mechanic_own_header'] = 'Centrale',
       ['msg_mechanic_own_subtitle'] = 'Centre de contrôle ACLS',
    
        -- Esx_Advanced_Notifications LSPD (Server)
       -- Onduty
       ['msg_police_header'] = 'Centrale',
       ['msg_police_subtitle'] = 'Centre de contrôle LSPD',
       ['msg_police_text'] = 'Vous avez besoin d\'aide? Le LSPD peut maintenant être contacté en appelant le 911!',
       ['msg_police_picture'] = 'CHAR_CALL911',
       ['msg_police_badged'] = 2,
       -- Break
       ['msg_police_text_break'] = 'Le LSPD n\'est pas disponible! ~s~Centre de contrôle ~r~non disponible temporairement!',
       -- Offduty
       ['msg_police_text_offduty'] = 'LSPD en mode abstreinte! ~s~~r~Personne de DISPONIBLE ~w~au standard!',
       -- OwnMessage
       ['msg_police_own_header'] = 'Centrale',
       ['msg_police_own_subtitle'] = 'Centre de contrôle LSPD',
   
       -- Esx_Advanced_Notifications Bennys (Server)
       -- Onduty
       ['msg_bennys_header'] = 'Centrale',
       ['msg_bennys_subtitle'] = 'Centre de contrôle Bennys',
       ['msg_bennys_text'] = 'Nous sommes à votre service! Bennys peut maintenant être contacté en appelant le 914!',
       ['msg_bennys_picture'] = 'CHAR_CHAT_CALL',
       ['msg_bennys_badged'] = 2,
       -- Break
       ['msg_bennys_text_break'] = 'Bennys n\'est pas disponible! ~s~Centre de contrôle ~r~non disponible temporairement!',
       -- Offduty
       ['msg_bennys_text_offduty'] = 'Le Bennys en mode abstreinte! ~s~~r~Personne de DISPONIBLE ~w~au standard!',
       -- OwnMessage
       ['msg_bennys_own_header'] = 'Centrale',
       ['msg_bennys_own_subtitle'] = 'Centre de contrôle Bennys',
    
       -- Esx_Advanced_Notifications LSMD (Server)
       -- Onduty
       ['msg_ambulance_header'] = 'Centrale',
       ['msg_ambulance_subtitle'] = 'Centre de contrôle EMS',
       ['msg_ambulance_text'] = 'Vous avez besoin d\'une assistance médicale? L\'hôpital peut maintenant être contacté en appelant le 912!',
       ['msg_ambulance_picture'] = 'CHAR_CALL911',
       ['msg_ambulance_badged'] = 2,
       -- Break
       ['msg_ambulance_text_break'] = 'Les EMS prennent maintenant une pause! ~s~Centre de contrôle ~r~non disponible temporairement!',
       -- Offduty
       ['msg_ambulance_text_offduty'] = 'Les EMS sont en mode abstreinte! ~s~~r~Personne de DISPONIBLE ~w~au standard!',
       -- OwnMessage
       ['msg_ambulance_own_header'] = 'Centrale',
       ['msg_ambulance_own_subtitle'] = 'Centre de contrôle EMS',
    
       -- Esx_Advanced_Notifications Cardealer (Server)
       -- Onduty
       ['msg_cardealer_header'] = 'Centrale',
       ['msg_cardealer_subtitle'] = 'Central téléphonique CarDealer',
       ['msg_cardealer_text'] = 'Vous avez trop d\'argent? Permettez-vous un peu de luxe en appelant le: 915!',
       ['msg_cardealer_picture'] = 'CHAR_CHAT_CALL',
       ['msg_cardealer_badged'] = 2,
       -- Break
       ['msg_cardealer_text_break'] = 'Le Cardealer prennent maintenant une pause! ~s~Le central est ~r~non disponible temporairement!',
       -- Offduty
       ['msg_cardealer_text_offduty'] = 'Les vendeurs ne sont plus la! ~s~~r~Personne de DISPONIBLE ~w~au standard!',
       -- OwnMessage
       ['msg_cardealer_own_header'] = 'Centrale',
       ['msg_cardealer_own_subtitle'] = 'Centre de contrôle Cardealer',
    },

}