<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\OrderSell;
use OpenAI\Laravel\Facades\OpenAI;
use Illuminate\Support\Facades\Http;

class ChatController extends Controller
{
    public function handle(Request $request)
    {
        $message = strtolower($request->input('message'));

        // Search by product name
        $product = Product::whereRaw('LOWER(name) LIKE ?', ["%{$message}%"])->first();

        if ($product) {
            // If product found
            $reply = "🛍️ **{$product->name}**\n";
            $reply .= "📄 Description: {$product->description}\n";
            $reply .= "💰 Price: " . number_format($product->price) . "đ\n";
            $reply .= "📦 In stock: {$product->stock} items\n";
            return response()->json(['reply' => $reply]);
        }

        // If product not found → use GPT-4
        $gptReply = $this->askGPT($message);

        return response()->json(['reply' => $gptReply]);
    }

    private function askGPT($message)
    {
        $client = OpenAI::client(env('OPENAI_API_KEY'));

        $response = $client->chat()->create([
            'model' => 'gpt-4',
            'messages' => [
                ['role' => 'system', 'content' => 'You are a helpful assistant for BTCK Organic shop, supporting customers.'],
                ['role' => 'user', 'content' => $message],
            ],
        ]);

        return $response->choices[0]->message->content;
    }
}
