<?php

namespace App\Http\Controllers;

use App\Events\MessageSent;
use App\Models\Message;
use Illuminate\Http\Request;

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
            'name' => 'string|required|min:2',
            'email' => 'email|required',
            'message' => 'required|min:20|max:200',
            'subject' => 'string|required',
            'phone' => 'numeric|required',
        ]);

        $message = Message::create($request->all());
        $data = [];
        $data['url'] = route('message.show', $message->id);
        $data['date'] = $message->created_at->format('F d, Y h:i A');
        $data['name'] = $message->name;
        $data['email'] = $message->email;
        $data['phone'] = $message->phone;
        $data['message'] = $message->message;
        $data['subject'] = $message->subject;
        $data['photo'] = Auth()->user()->photo;
        event(new MessageSent($data));
        exit();
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
