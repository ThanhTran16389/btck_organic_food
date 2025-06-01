<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Thank You</title>
    <style>
        /* Style modal */
        .modal {
            display: block;
            /* Mặc định hiện */
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border-radius: 5px;
            width: 300px;
            position: relative;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            color: #aaa;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }

        .close-btn:hover {
            color: #000;
        }
    </style>
</head>

<body>

    <!-- Modal -->
    <div id="thankYouModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" id="closeModal">&times;</span>
            <h2>Thank you for your order!</h2>
            <p>Your order ID: {{ session('order_id') }}</p>
        </div>
    </div>

    <script>
        document.getElementById('closeModal').onclick = function() {
            document.getElementById('thankYouModal').style.display = "none";
            // Nếu bạn muốn khi tắt popup tự chuyển hướng khác, có thể dùng:
            // window.location.href = "/";
        }

        // Ngoài ra, bấm ra ngoài modal cũng có thể tắt popup:
        window.onclick = function(event) {
            const modal = document.getElementById('thankYouModal');
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

</body>

</html>
