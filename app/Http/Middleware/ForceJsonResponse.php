<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ForceJsonResponse
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $request->headers->set('Accept', 'application/json');
        $client_id     = $request->client_id;
        $client_secret = $request->client_secret;

        $cek_client_apps = DB::table('oauth_clients')
                                ->where([
                                    'id'     => $client_id,
                                    'secret' => $client_secret,
                                ])
                                ->count();
        if($cek_client_apps != 1 ) {
            return response()->json([
                'response' => 'unauthorized',
            ], 401);
        }
        if (! $request->expectsJson()) {
            return response()->json([
                'response' => 'unauthorized',
            ], 401);
        }
        return $next($request);
    }
}
