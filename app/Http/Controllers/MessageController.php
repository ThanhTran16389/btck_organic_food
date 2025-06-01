<?php

namespace App\Http\Controllers;

use App\Events\MessageSent;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'string|required|min:2',
            'email' => 'email|required',
            'message' => 'required|min:20|max:200',
            'subject' => 'string|required',
            'phone' => 'numeric|required',
        ]);


        $message = Message::create([
            'name' => $request->name,
            'email' => $request->email,
            'message' => $request->message,
            'subject' => $request->subject,
            'phone' => $request->phone,
        ]);

        $data = [
            'subject' => $request->subject,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'date' => now()->toDateTimeString(),
            'user_message' => $request->message,
            'url' => route('admin.messages.index')
        ];

        // Gửi mail về email admin
        Mail::send('emails.contact', $data, function ($m) use ($data) {
            $m->to('dinhvan141195@gmail.com')
              ->subject('New Contact: ' . $data['subject'])
              ->replyTo($data['email']);
        });

        event(new MessageSent($data));
        return response()->json(['success' => true, 'message' => 'Message sent successfully']);
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
