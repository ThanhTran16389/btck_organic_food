<!DOCTYPE html>
<html lang="zxx">

<head>
    @include('frontend.layouts.head')
    {{-- @stack('styles') --}}
</head>

<body class="js">

    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- End Preloader -->

    @include('frontend.layouts.notification')

    <!-- Header -->
    @include('frontend.layouts.header')
    <!--/ End Header -->

    <!-- Floating Chatbot Button + Iframe -->
<style>


    #chatbot-iframe {
        display: none;
        position: fixed;
        bottom: 80px;
        right: 20px;
        width: 350px;
        height: 500px;
        border: none;
        z-index: 9998;
        box-shadow: 0 0 10px rgba(0,0,0,0.3);
        border-radius: 10px;
    }
    </style>

<button id="chatbot-toggle">
    <img src="{{ asset('images/ChatBot.png') }}" alt="ChatBot">
</button>

<style>
#chatbot-toggle {
    position: fixed;
    bottom: 25px;
    right: 25px;
    background: transparent;
    border-radius: 50%;
    padding: 0;
    z-index: 9999;
    cursor: pointer;
    background-color: green
}

#chatbot-toggle img {
    width: 50px;
    height: 50px;
    border-radius: 90%;
    object-fit: cover;
    background-color: green
    transition: transform 0.2s ease;
}

#chatbot-toggle img:hover {
    transform: scale(1.1);
}
}
</style>
    <iframe id="chatbot-iframe"
        src="http://localhost/btck_organic_food/public/chatbot"
        title="Chatbot"
        allow="clipboard-write"
></iframe>


    <script>
    document.getElementById("chatbot-toggle").onclick = function () {
        var iframe = document.getElementById("chatbot-iframe");
        iframe.style.display = iframe.style.display === "block" ? "none" : "block";
    };
    </script>


    @yield('main-content')

    <!-- Chatzalo -->
    @include('frontend.layouts.chatcontact')

    @include('frontend.layouts.footer')

    @stack('scripts')

</body>

</html>
