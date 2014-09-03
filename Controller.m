/*****************************************************************************
 * test: Controller.m
 *****************************************************************************
 * Copyright (C) 2007-2013 Pierre d'Herbemont and VideoLAN
 *
 * Authors: Pierre d'Herbemont
 *          Felix Paul Kühne
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
 *****************************************************************************/

#import "Controller.h"

@implementation Controller

- (void)awakeFromNib
{
    [NSApp setDelegate:self];

    // Allocate a VLCVideoView instance and tell it what area to occupy.
    NSRect rect1 = NSMakeRect(0, 0, 0, 0);
    rect1.size = [videoView1 frame].size;

    vlcVideoView1 = [[VLCVideoView alloc] initWithFrame:rect1];
    [videoView1 addSubview:vlcVideoView1];
    [vlcVideoView1 setAutoresizingMask: NSViewHeightSizable|NSViewWidthSizable];
    vlcVideoView1.fillScreen = YES;
    
    player1 = [[VLCMediaPlayer alloc] initWithVideoView:vlcVideoView1];
    
    NSRect rect2 = NSMakeRect(0, 0, 0, 0);
    rect2.size = [videoView2 frame].size;
    
    vlcVideoView2 = [[VLCVideoView alloc] initWithFrame:rect2];
    [videoView2 addSubview:vlcVideoView2];
    [vlcVideoView2 setAutoresizingMask: NSViewHeightSizable|NSViewWidthSizable];
    vlcVideoView2.fillScreen = YES;
    
    player2 = [[VLCMediaPlayer alloc] initWithVideoView:vlcVideoView2];
    
    
    NSRect rect3 = NSMakeRect(0, 0, 0, 0);
    rect3.size = [videoView3 frame].size;
    
    vlcVideoView3 = [[VLCVideoView alloc] initWithFrame:rect3];
    [videoView3 addSubview:vlcVideoView3];
    [vlcVideoView3 setAutoresizingMask: NSViewHeightSizable|NSViewWidthSizable];
    vlcVideoView3.fillScreen = YES;
    
    player3 = [[VLCMediaPlayer alloc] initWithVideoView:vlcVideoView3];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString *sampleVideo = @"http://media.rc.rit.edu/grav-screenshots/grav264.video.mp4-ipad.video.mp4";
    
    [textField1 setStringValue:sampleVideo];
    [textField2 setStringValue:sampleVideo];
    [textField3 setStringValue:sampleVideo];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
}

- (IBAction)play1:(id)sender {
    NSLog(@"play 1 pressed");
    
    VLCMedia *media = [VLCMedia mediaWithURL:[NSURL URLWithString:[textField1 stringValue]]];
    [player1 setMedia:media];
    [player1 play];
}

- (IBAction)play2:(id)sender {
    NSLog(@"play 2 pressed");
    
    VLCMedia *media = [VLCMedia mediaWithURL:[NSURL URLWithString:[textField2 stringValue]]];
    [player2 setMedia:media];
    [player2 play];
}

- (IBAction)play3:(id)sender {
    NSLog(@"play 3 pressed");
    
    VLCMedia *media = [VLCMedia mediaWithURL:[NSURL URLWithString:[textField3 stringValue]]];
    [player3 setMedia:media];
    [player3 play];
}

//- (void)pause:(id)sender
//{
//    NSLog(@"Sending pause message to media player...");
//    [player pause];
//}

//- (void)mediaPlayerStateChanged:(NSNotification *)aNotification
//{
//    if (player.media) {
//        NSArray *spuTracks = [player videoSubTitlesNames];
//        NSArray *spuTrackIndexes = [player videoSubTitlesIndexes];
//
//        NSUInteger count = [spuTracks count];
//        [spuPopup removeAllItems];
//        if (count <= 1)
//            return;
//
//        for (NSUInteger x = 0; x < count; x++) {
//            [spuPopup addItemWithTitle:spuTracks[x]];
//            [[spuPopup lastItem] setTag:spuTrackIndexes[x]];
//        }
//    }
//}

//- (void)setSPU:(id)sender
//{
//    if (player.media)
//        player.currentVideoSubTitleIndex = [[spuPopup selectedItem] tag];
//}
//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"media"] && object == playlist)
//        [playlistOutline reloadData];
//}

// NSTableView Implementation
//- (int)numberOfRowsInTableView:(NSTableView *)tableView
//{
//    return [playlist count];
//}
//
//- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn
//            row:(int)row
//{
//    NSString *title = [(VLCMedia *)[playlist mediaAtIndex:row].metaDictionary valueForKey:VLCMetaInformationTitle];
//
//    return title ? title : [playlist mediaAtIndex:row].url.lastPathComponent;
//}
//
//- (NSDragOperation)tableView:(NSTableView*)tv validateDrop:(id <NSDraggingInfo>)info
//                 proposedRow:(int)row proposedDropOperation:(NSTableViewDropOperation)op
//{
//    return NSDragOperationEvery; /* This is for now */
//}
//
//- (BOOL)tableView:(NSTableView *)aTableView acceptDrop:(id <NSDraggingInfo>)info
//              row:(int)row dropOperation:(NSTableViewDropOperation)operation
//{
//    NSArray *droppedItems = [[info draggingPasteboard] propertyListForType:NSFilenamesPboardType];
//
//    for (int i = 0; i < [droppedItems count]; i++) {
//        NSString * filename = [droppedItems objectAtIndex:i];
//        VLCMedia * media = [VLCMedia mediaWithPath:filename];
//        [playlist addMedia:media];
//    }
//    return YES;
//}

@end