<?php

namespace App\Http\Controllers;

use App\Events\MessageSent;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactMessageMail;
use Exception;

class MessageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $messages = Message::paginate(20);

        return view('backend.message.index')->with('messages', $messages);
    }

    public function messageFive()
    {
        $message = Message::whereNull('read_at')->limit(5)->get();

        return response()->json($message);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
{
    $this->validate($request, [
        'name' => 'required|string|min:2',
        'email' => 'required|email',
        'message' => 'required|min:20|max:200',
        'subject' => 'required|string',
        'phone' => 'required|numeric',
    ]);

    try {
        $message = Message::create($request->all());

        $data = [
            'name' => $message->name,
            'email' => $message->email,
            'phone' => $message->phone,
            'subject' => $message->subject,
            'message' => $message->message,
        ];

        try {
            Mail::to('dinhvan141195@gmail.com')->send(new ContactMessageMail($data));
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'error' => $e->getMessage()]);
        }
        return response()->json(['success' => true]);
    } catch (Exception $e) {
        return response()->json([
            'success' => false,
            'message' => 'Gửi mail thất bại',
            'error' => $e->getMessage()
        ], 500);
    }
}
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $message = Message::find($id);
        if ($message) {
            $message->read_at = \Carbon\Carbon::now();
            $message->save();

            return view('backend.message.show')->with('message', $message);
        } else {
            return back();
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $message = Message::find($id);
        $status = $message->delete();
        if ($status) {
            request()->session()->flash('success', 'Deleted message successfully');
        } else {
            request()->session()->flash('error', 'Error occurred please try again');
        }

        return back();
    }
}
