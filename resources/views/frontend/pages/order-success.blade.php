<!-- Modal Order Success -->
<div class="modal fade" id="orderSuccessModal" tabindex="-1" aria-labelledby="orderSuccessModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered custom-modal-width">
        <div class="modal-content text-center p-4">
            <div class="modal-header position-relative border-0 justify-content-center">
                <h5 class="modal-title text-success fw-bold w-100 text-center d-block m-0">
                    <span style="font-size: 1.2rem;">🎉</span> Order Placed Successfully!
                </h5>
                <button type="button" class="btn-close position-absolute end-0 top-0 m-3" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="mt-3 mb-2">Thank you for your purchase!</p>
                <p class="mb-1"><strong>Order Number:</strong> {{ session('order_number') }}</p>
                <p class="mb-3"><strong>Total Payment:</strong>
                    {{ number_format(session('order_total'), 0, ',', '.') }}$</p>
            </div>
            <div class="modal-footer border-0 justify-content-center">
                <button type="button" class="btn btn-success" id="closeModalBtn">
                    <a class = "btn" href="{{ route('home') }}">BACK TO HOMEPAGE</a>
                </button>
            </div>
        </div>
    </div>
</div>

<style>
    /* Căn giữa nội dung */
    .modal-dialog {
        max-width: 400px;
        margin: 1.75rem auto;
    }

    /* Giảm chiều cao */
    .modal-content {
        padding: 1rem 1rem;
    }

    .modal-header,
    .modal-body,
    .modal-footer {
        padding: 0.5rem 0 !important;
    }

    .modal-title {
        font-size: 1.3rem;
        font-weight: bold;
        color: #28a745;
        text-align: center;
        margin: 0 auto;
    }

    .modal-body p {
        margin: 0.25rem 0;
        font-size: 0.95rem;
    }

    .modal-footer {
        justify-content: center;
    }

    .modal-footer .btn {
        padding: 0.4rem 1.2rem;
        font-size: 0.9rem;
    }
</style>

<!-- Script to show modal -->
@if (session('show_success_modal'))
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const modal = new bootstrap.Modal(document.getElementById('orderSuccessModal'));
            modal.show();

            document.getElementById('closeModalBtn').addEventListener('click', function() {
                window.location.href = "{{ route('home') }}";
            });
        });
    </script>
@endif
