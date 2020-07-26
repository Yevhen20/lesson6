use WWW::Telegram::BotAPI;
my $api = WWW::Telegram::BotAPI->new (
    token => '1151108456:AAHVodsjEDiwY5QFxF5ZOAKX34HqRLYuZ6g'
);
# The API methods die when an error occurs.
say $api->getMe->{result}{username};
# Uploading files is easier than ever.
$api->sendPhoto ({
    chat_id => 123456,
    photo   => {
        file => "/home/me/cool_pic.png"
    },
    caption => "Look at my cool photo!"
});
# Asynchronous request support with Mojo::UserAgent.
$api = WWW::Telegram::BotAPI->new (
    token => 'my_token',
    async => 1
);
$api->sendMessage ({
    chat_id => 123456,
    text    => 'Hello world!'
}, sub {
    my ($ua, $tx) = @_;
    die "Something bad happened!" unless $tx->success;
    say $tx->res->json->{ok} ? "YAY!" : ":(";
});
Mojo::IOLoop->start;