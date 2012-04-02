package com.gwenhael.astar;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

import com.gwenhael.astar.Star;

public class AStarActivity extends Activity
{
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        // setContentView(R.layout.main);

        Star star = new Star(  );
        TextView board = new TextView( this );

        board.setText( star.toString(  ) );
        board.setTypeface( android.graphics.Typeface.MONOSPACE );

        setContentView( board );

    }
}
